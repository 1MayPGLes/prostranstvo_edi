import os
from flask import Blueprint, request, render_template, current_app, session
from DB.funcDB import select
from DB.SQLProvider import SQLProvider
from access import login_required, group_required

landing = Blueprint('landing', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

@landing.route('/')
@login_required
@group_required
def goLanding():
    services = [
        {'name': 'Диагностика', 'img': 'skoraya.png'},
        {'name': 'Вызов врача на дом', 'img': 'Vyzov-vracha-na-dom.png'},
        {'name': 'Взрослая стоматология', 'img': 'Vzroslaya-stomatologiya.png'},
        {'name': 'Детская стоматология', 'img': 'Detskaya-stomatologiya.png'},
        {'name': 'Анализы', 'img': 'Analizy.png'},
        {'name': 'Комплексная программа', 'img': 'CHekapy.png'}
    ]

    _sql = provider.get('specialist.sql')
    specialistResult, specialistSchema = select(current_app.config['configDB'], _sql)
    specialistResult = [item[0] for item in specialistResult]
    # _sql = provider.get('doctor.sql')
    # doctorResult, doctorSchema = select(current_app.config['configDB'], _sql)
    return render_template('landing.html', title='Клиника «Измайловская» им. А.С. Багирова', services=services, specialist=specialistResult)