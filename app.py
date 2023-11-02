from DB.funcDB import select
from flask import Flask, render_template, json, session
from blueprintQuery.query import query
from blueprintAuth.auth import auth
from access import login_required

app = Flask(__name__, template_folder='templates', static_folder="static")
app.secret_key = 'lj8fw3nd88fasf854hskm454hnpdvu4e8'

app.register_blueprint(query, url_prefix='/query')
app.register_blueprint(auth, url_prefix='/auth')

app.config['configDB'] = json.load(open('data/configDB.json'))
app.config['access'] = json.load(open('data/access.json'))

@app.route('/')
@login_required
def index():
    job = [
        {'name': 'Кассир', 'img': 'kass.jpg'},
        {'name': 'Пекарь', 'img': 'backer.jpg'},
        {'name': 'Администратор', 'img': 'admin.png'},
        {'name': 'Мерчендайзер', 'img': 'merch.jpg'},
        {'name': 'Охранник', 'img': 'secur.jpg'},
        {'name': 'Курьер', 'img': 'dost.jpg'}
    ]
    product = f"""
                    SELECT prod_name
                    FROM product 
                """
    productResult, productSchema = select(app.config['configDB'], product)
    productResult = [item[0] for item in productResult]

    sale = f"""
                    SELECT prod_name, prod_price, prod_img
                    FROM product 
                    WHERE prod_sale = TRUE
                """
    saleResult, saleSchema = select(app.config['configDB'], sale)

    if session.get('user_group', None):
        return render_template('internal.html', title='Пространство еды', job=job, product=productResult, sale=saleResult)
    return render_template('external.html', title='Пространство еды', job=job, product=productResult, sale=saleResult)

@app.route('/exit')
@login_required
def exit():
    session.clear()
    return render_template('exit.html', title='Выход из системы')

@app.errorhandler(404)
@login_required
def page_not_found(error):
    return render_template('page_not_found.html', title='Cтраница не найдена')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)