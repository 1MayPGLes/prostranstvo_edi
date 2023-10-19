from funcDB import select
from config import host, port, user, password, database
from flask import Flask, render_template, url_for, request, abort, flash, session, redirect, g
from blueprintQuery.query import query
# from UserLogin import UserLogin
# from werkzeug.security import generate_password_hash, check_password_hash
# from flask_login import LoginManager, login_user

DEBUG = True
SECRET_KEY = 'lj8fw3nd88fasf854hskm454hnpdvu4e8'

app = Flask(__name__)
app.register_blueprint(query, url_prefix='/query')

# login_manager = LoginManager(app)

configDB = {
    'host': host,
    'port': port,
    'user': user,
    'password': password,
    'database': database
}

# @login_manager.user_loader
# def load_user(user_id):
#     return UserLogin().fromDB(user_id, dbase)

@app.route('/')
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
    productResult = select(configDB, product)
    productResult = [item[0] for item in productResult]

    skidki = f"""
                SELECT prod_name, prod_price, prod_img
                FROM product 
            """
    skidkiResult = select(configDB, skidki)

    return render_template('index.html', title='Пространство еды', job=job, product=productResult, skidki=skidkiResult)

# @app.route('/authorization', methods=['POST'])
# def authorization():
#     user = dbase.getUserByLogin(request.form['username'])
#     if user and check_password_hash(user['psw'], request.form['password']):
#         userlogin = UserLogin().create(user)
#         login_user(userlogin)
#         return redirect(url_for('profile', username=request.form['username']))
#     else:
#         flash("Неверная пара логин/пароль", category="alert-danger")
#     return redirect(url_for('index'))
#
# @app.route('/registration', methods=['POST'])
# def registration():
#     if len(request.form['username']) > 4 and len(request.form['email']) > 4 \
#             and len(request.form['password1']) > 4 and request.form['password1'] == request.form['password2']:
#         hash = generate_password_hash(request.form['password1'])
#         res = dbase.addUser(request.form['username'], request.form['email'], hash)
#         if res:
#             flash("Вы успешно зарегистрированы", category="alert-success")
#             return redirect(url_for('index'))
#         else:
#             flash("Ошибка при добавлении в БД", category="alert-danger")
#     else:
#         flash("Неверно заполнены поля", category="alert-danger")
#     return redirect(url_for('index'))
#
# @app.route('/profile/<username>', methods=['POST', 'GET'])
# def profile(username):
#     if 'userLogged' not in session or session['userLogged'] != username:
#         abort(401)
#     return render_template('profile.html', title='Личный кабинет', username=session['userLogged'])

@app.errorhandler(404)
def page_not_found(error):
    return render_template('page_not_found.html', title='Cтраница не найдена')

@app.errorhandler(401)
def page_not_found(error):
    return render_template('unauthorized.html', title='Отказ в доступе')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)