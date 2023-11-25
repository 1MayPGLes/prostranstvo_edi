import os
from flask import Blueprint, request, render_template, current_app, session
from DB.funcDB import select
from DB.SQLProvider import SQLProvider
from access import login_required, group_required

account = Blueprint('account', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

@account.route('/')
@login_required
@group_required
def queries():
    return render_template('query.html', title='Работа с запросами')

@account.route('/selectPatient', methods=['GET', 'POST'])
@login_required
@group_required
def selectPatient():
    if request.method == 'GET':
        return render_template('selectPatient.html', title='Запрос данных о назначенных врачу пациентах')
    else:
        inputPatient = request.form.get('inputPatient')
        if len(inputPatient) == 0:
            message = 'Вывод запроса'
            _sql = provider.get('patientAll.sql', inputDoc=session['user_id'])
            patientResult, patientSchema = select(current_app.config['configDB'], _sql)
            return render_template('selectPatient.html', title='Запрос данных о назначенных врачу пациентах', message=message, schema=patientSchema, result=patientResult)
        if inputPatient.isdigit() != True:
            message = 'Ошибка ввода'
            return render_template('selectPatient.html', title='Запрос данных о назначенных врачу пациентах', message=message)
        else:
            message = 'Вывод запроса'
            _sql = provider.get('patient.sql', inputDoc=session['user_id'], inputPatient=int(inputPatient))
            patientResult, patientSchema = select(current_app.config['configDB'], _sql)
            return render_template('selectPatient.html', title='Запрос данных о назначенных врачу пациентах', message=message, schema=patientSchema, result=patientResult)

@account.route('/selectInspection', methods=['GET', 'POST'])
@login_required
@group_required
def selectInspection():
    if request.method == 'GET':
        return render_template('selectInspection.html', title='Запрос данных о проводимых врачом осмотрах')
    else:
        inputInspection = request.form.get('inputInspection')
        if len(inputInspection) == 0:
            message = 'Вывод запроса'
            _sql = provider.get('inspectionAll.sql', inputDoc=session['user_id'])
            inspectionResult, inspectionSchema = select(current_app.config['configDB'], _sql)
            return render_template('selectInspection.html', title='Запрос данных о проводимых врачом осмотрах', message=message, schema=inspectionSchema, result=inspectionResult)
        if inputInspection.isdigit() != True:
            message = 'Ошибка ввода'
            return render_template('selectInspection.html', title='Запрос данных о проводимых врачом осмотрах', message=message)
        else:
            message = 'Вывод запроса'
            _sql = provider.get('inspection.sql', inputDoc=session['user_id'], inputInspection=int(inputInspection))
            inspectionResult, inspectionSchema = select(current_app.config['configDB'], _sql)
            return render_template('selectInspection.html', title='Запрос данных о проводимых врачом осмотрах', message=message, schema=inspectionSchema, result=inspectionResult)