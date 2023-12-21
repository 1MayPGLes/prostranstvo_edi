import os
import re
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
    return render_template('query.html', title='Работа с запросами')

@query.route('/selectPatient', methods=['GET', 'POST'])
@login_required
@group_required
def selectPatient():
    if request.method == 'GET':
        return render_template('selectPatient.html', title='Запрос данных о назначенных врачу пациентах')
    else:
        inputDoctor = request.form.get('inputDoctor')
        if len(inputDoctor) == 0:
            message = 'Введите номер доктора'
            return render_template('selectPatient.html', title='Запрос данных о назначенных врачу пациентах', message=message)
        if inputDoctor.isdigit() != True:
            message = 'Ошибка ввода'
            return render_template('selectPatient.html', title='Запрос данных о назначенных врачу пациентах', message=message)
        else:
            message = 'Вывод запроса'
            _sql = provider.get('patient.sql', inputDoctor=int(inputDoctor))
            patientResult, patientSchema = select(current_app.config['configDB'], _sql)
            if len(patientResult) == 0:
                message = 'У данного доктора нет пациентов'
                return render_template('selectPatient.html', title='Запрос данных о назначенных врачу пациентах',message=message)
            return render_template('selectPatient.html', title='Запрос данных о назначенных врачу пациентах', message=message, schema=patientSchema, result=patientResult)

@query.route('/selectInspection', methods=['GET', 'POST'])
@login_required
@group_required
def selectInspection():
    if request.method == 'GET':
        return render_template('selectInspection.html', title='Запрос данных о осмотрах пациента')
    else:
        inputMed_card = request.form.get('inputMed_card')
        if len(inputMed_card) == 0:
            message = 'Введите номер медицинской карты пациента'
            return render_template('selectInspection.html', title='Запрос данных о осмотрах пациента', message=message)
        if inputMed_card.isdigit() != True:
            message = 'Ошибка ввода'
            return render_template('selectInspection.html', title='Запрос данных о осмотрах пациента', message=message)
        else:
            message = 'Вывод запроса'
            _sql = provider.get('inspection.sql', inputMed_card=int(inputMed_card))
            inspectionResult, inspectionSchema = select(current_app.config['configDB'], _sql)
            if len(inspectionResult) == 0:
                message = 'У данного пациента нет проведённых осмотров'
                return render_template('selectInspection.html', title='Запрос данных о осмотрах пациента',message=message)
            return render_template('selectInspection.html', title='Запрос данных о осмотрах пациента', message=message, schema=inspectionSchema, result=inspectionResult)

@query.route('/selectDate', methods=['GET', 'POST'])
@login_required
@group_required
def selectDate():
    pattern = r'\d{4}-\d{2}-\d{2}'
    if request.method == 'GET':
        return render_template('selectDate.html', title='Запрос данных о поступивших в определённый день пациентах')
    else:
        inputDate = request.form.get('inputDate')
        if len(inputDate) == 0:
            message = 'Введите дату типа \'2017-06-22\''
            return render_template('selectDate.html', title='Запрос данных о поступивших в определённый день пациентах', message=message)
        if re.fullmatch(pattern, inputDate):
            message = 'Вывод запроса'
            _sql = provider.get('date.sql', inputDate=inputDate)
            dateResult, dateSchema = select(current_app.config['configDB'], _sql)
            if len(dateResult) == 0:
                message = 'В этот день пациентов не поступало'
                return render_template('selectDate.html', title='Запрос данных о поступивших в определённый день пациентах', message=message)
            return render_template('selectDate.html', title='Запрос данных о поступивших в определённый день пациентах', message=message, schema=dateSchema, result=dateResult)
        else:
            message = 'Ошибка ввода, введите дату типа \'2017-06-29\''
            return render_template('selectDate.html', title='Запрос данных о поступивших в определённый день пациентах', message=message)