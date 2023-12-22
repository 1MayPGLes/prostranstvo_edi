import os
from flask import Blueprint, render_template, current_app, session
from DB.funcDB import select
from DB.SQLProvider import SQLProvider
from access import login_required, group_required

account = Blueprint('account', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

def choose_noun_form(age):
    last_two_digits = age % 100

    if 11 <= last_two_digits <= 19:
        return "лет"
    last_digit = last_two_digits % 10
    if last_digit == 1:
        return "год"
    if 2 <= last_digit <= 4:
        return "года"
    return "лет"

@account.route('/')
@login_required
@group_required
def getAccount():
    _sql = provider.get('info.sql', inputPatient=session['user_id'])
    infoResult, infoSchema = select(current_app.config['configDB'], _sql)
    _sql = provider.get('inspectionInfo.sql', inputPatient=session['user_id'])
    insResult, insSchema = select(current_app.config['configDB'], _sql)
    inits = infoResult[0][0]
    age = infoResult[0][1]
    return render_template('account.html', title='Личный кабинет', inits=inits, age=age, chisl=choose_noun_form(age), info=infoResult, ins=insResult)