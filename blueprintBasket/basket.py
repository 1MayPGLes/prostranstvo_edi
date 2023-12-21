import os
from flask import Blueprint, request, render_template, current_app, session, redirect, url_for
from DB.funcDB import select
from DB.SQLProvider import SQLProvider
from cache.wrapper import fetch_from_cache
from access import login_required, group_required

basket = Blueprint('basket', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

@basket.route('/', methods=['GET', 'POST'])
@login_required
@group_required
def market_index():
	configDB = current_app.config['configDB']
	cache_config = current_app.config['cache']
	cached_func = fetch_from_cache('all_items_cached', cache_config)(select)

	if request.method == 'GET':
		sql = provider.get('all_items.sql')
		items = cached_func(configDB, sql)
		basket_items = session.get('basket', {})
		return render_template('market.html', title='Маркет', items=items[0], basket_items=basket_items)
	else:
		prod_id = request.form['prod_id']
		sql = provider.get('all_items.sql')
		items = cached_func(configDB, sql)

		item_description = []
		for i in range(len(items[0])):
			if str(items[0][i][0]) == str(prod_id):
				print(items[0][i])
				item_description.append(items[0][i])

		if not item_description:
			return render_template('item_missing.html', title='Товар на складе отсутствует')

		item_description = item_description[0]
		curr_basket = session.get('basket', {})

		if prod_id in curr_basket:
			curr_basket[prod_id]['price'] = curr_basket[prod_id]['price'] + item_description[2]
			curr_basket[prod_id]['cnt'] = curr_basket[prod_id]['cnt'] + 1
		else:
			curr_basket[prod_id] = {
				'name': item_description[1],
				'price': item_description[2],
				'cnt': 1
			}
		session['basket'] = curr_basket
		session.permanent = True

		return redirect(url_for('basket.market_index'))

@basket.route('/payment', methods=['GET', 'POST'])
@login_required
@group_required
def payment():
	configDB = current_app.config['configDB']
	cache_config = current_app.config['cache']
	cached_func = fetch_from_cache('all_items_cached', cache_config)(select)

	if request.method == 'GET':
		sql = provider.get('all_items.sql')
		items = cached_func(configDB, sql)
		basket_items = session.get('basket', {})
		return render_template('market.html', title='Маркет', items=items[0], basket_items=basket_items)
	else:
		prod_id = request.form['prod_id']
		sql = provider.get('all_items.sql')
		items = cached_func(configDB, sql)

		item_description = []
		for i in range(len(items[0])):
			if str(items[0][i][0]) == str(prod_id):
				print(items[0][i])
				item_description.append(items[0][i])

		if not item_description:
			return render_template('item_missing.html', title='Товар на складе отсутствует')

		item_description = item_description[0]
		curr_basket = session.get('basket', {})

		if prod_id in curr_basket:
			curr_basket[prod_id]['price'] = curr_basket[prod_id]['price'] + item_description[2]
			curr_basket[prod_id]['cnt'] = curr_basket[prod_id]['cnt'] + 1
		else:
			curr_basket[prod_id] = {
				'name': item_description[1],
				'price': item_description[2],
				'cnt': 1
			}
		session['basket'] = curr_basket
		session.permanent = True

		return redirect(url_for('basket.market_index'))

@basket.route('/clear-basket')
@login_required
@group_required
def clear_basket():
	if 'basket' in session:
		session.pop('basket')
	return redirect(url_for('basket.market_index'))