import os
from typing import Optional, Dict
from flask import Blueprint, request, render_template, current_app, session, redirect, url_for
from DB.funcDB import select_dict
from DB.SQLProvider import SQLProvider

auth = Blueprint('auth', __name__, template_folder='templates')
provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

@auth.route('/', methods=['GET', 'POST'])
def start_auth():
    if request.method == 'GET':
        return render_template('authorization.html', title='Авторизация', message='')
    else:
        login = request.form.get('login')
        password = request.form.get('password')
        if login:
            user_info = define_user(login, password)
            print(user_info)
            if user_info:
                user_dict = user_info[0]
                if user_dict['user_group'] == None:
                    user_dict['user_group'] = 'patient'
                session['user_id'] = user_dict['user_id']
                session['user_group'] = user_dict['user_group']

                session.permanent = True
                return redirect(url_for('index'))
            else:
                return render_template('authorization.html', title='Авторизация', message='Пользователь не найден')
        return render_template('authorization.html', title='Авторизация', message='Повторите ввод')


def define_user(login: str, password: str) -> Optional[Dict]:
    sql_doctor = provider.get('doctor.sql', login=login, password=password)
    sql_patient = provider.get('patient.sql', login=login, password=password)

    user_info = None

    for sql_search in [sql_doctor, sql_patient]:
        _user_info = select_dict(current_app.config['configDB'], sql_search)
        if _user_info:
            user_info = _user_info
            del _user_info
            break
    return user_info