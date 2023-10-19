import os
from flask import Blueprint, request, render_template, current_app
from funcDB import select
from SQLProvider import SQLProvider

query = Blueprint('query', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

@query.route('/', methods=['GET', 'POST'])
def queries():
    if request.method == 'GET':
        return render_template('query.html', title='Страницу запросов к товарам')
    else:
        inputCategory = request.form.get('inputCategory')
        inputPrice = request.form.get('inputPrice')
        inputProduct = request.form.get('inputProduct')
        inputSale = request.form.get('inputSale')
        if (inputSale != '1') and (inputSale != '0'):
            inputSale = None

        if inputCategory:
            _sql = provider.get('category.sql', inputCategory=inputCategory)
            categoryResult, categorySchema = select(current_app.config['configDB'], _sql)
            return render_template('query.html', title='Страницу запросов к товарам', schema=categorySchema, result=categoryResult)
        elif inputPrice:
            _sql = provider.get('price.sql', inputPrice=inputPrice)
            priceResult, priceSchema = select(current_app.config['configDB'], _sql)
            return render_template('query.html', title='Страницу запросов к товарам', schema=priceSchema, result=priceResult)
        elif inputProduct:
            _sql = provider.get('product.sql', inputProduct=inputProduct)
            productResult, productSchema = select(current_app.config['configDB'], _sql)
            return render_template('query.html', title='Страницу запросов к товарам', schema=productSchema, result=productResult)
        elif inputSale:
            _sql = provider.get('sale.sql', inputSale=inputSale)
            saleResult, saleSchema = select(current_app.config['configDB'], _sql)
            return render_template('query.html', title='Страницу запросов к товарам', schema=saleSchema, result=saleResult)
        else:
            return render_template('query.html', title='Страницу запросов к товарам')