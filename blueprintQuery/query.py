import os
from flask import Blueprint, request, render_template, current_app
from DB.funcDB import select
from DB.SQLProvider import SQLProvider
from access import login_required, group_required

query = Blueprint('query', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

@query.route('/')
@login_required
@group_required
def queries():
    return render_template('query.html', title='Страницу запросов к товарам')

@query.route('/product', methods=['GET', 'POST'])
@login_required
@group_required
def product():
    if request.method == 'GET':
        return render_template('product.html', title='Запрос товаров по названию')
    else:
        inputProduct = request.form.get('inputProduct')
        if inputProduct:
            _sql = provider.get('product.sql', inputProduct=inputProduct)
            productResult, productSchema = select(current_app.config['configDB'], _sql)
            return render_template('product.html', title='Запрос товаров по названию', schema=productSchema, result=productResult)
        else:
            return render_template('product.html', title='Запрос товаров по названию')

@query.route('/category', methods=['GET', 'POST'])
@login_required
@group_required
def category():
    if request.method == 'GET':
        return render_template('category.html', title='Запрос товаров по категории')
    else:
        inputCategory = request.form.get('inputCategory')
        if inputCategory:
            _sql = provider.get('category.sql', inputCategory=inputCategory)
            categoryResult, categorySchema = select(current_app.config['configDB'], _sql)
            return render_template('category.html', title='Запрос товаров по категории', schema=categorySchema, result=categoryResult)
        else:
            return render_template('category.html', title='Запрос товаров по категории')

@query.route('/price', methods=['GET', 'POST'])
@login_required
@group_required
def price():
    if request.method == 'GET':
        return render_template('price.html', title='Запрос товаров по цене')
    else:
        inputPrice = request.form.get('inputPrice')
        if inputPrice:
            _sql = provider.get('price.sql', inputPrice=inputPrice)
            priceResult, priceSchema = select(current_app.config['configDB'], _sql)
            return render_template('price.html', title='Запрос товаров по цене', schema=priceSchema, result=priceResult)
        else:
            return render_template('price.html', title='Запрос товаров по цене')

@query.route('/sale', methods=['GET', 'POST'])
@login_required
@group_required
def sale():
    if request.method == 'GET':
        return render_template('sale.html', title='Запрос товаров по наличию скидки')
    else:
        inputSale = request.form.get('inputSale')
        if (inputSale != '1') and (inputSale != '0'):
            inputSale = None
        if inputSale:
            _sql = provider.get('sale.sql', inputSale=inputSale)
            saleResult, saleSchema = select(current_app.config['configDB'], _sql)
            return render_template('sale.html', title='Запрос товаров по наличию скидки', schema=saleSchema, result=saleResult)
        else:
            return render_template('sale.html', title='Запрос товаров по наличию скидки')