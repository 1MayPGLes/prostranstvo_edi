import os
from flask import Blueprint, request, render_template, current_app, session
from DB.funcDB import select, call_proc
from DB.SQLProvider import SQLProvider
from access import login_required, group_required

report = Blueprint('report', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

@report.route('/')
@login_required
@group_required
def reports():
    return render_template('report.html', title='Работа с отчётами')

@report.route('/getReportPat', methods=['GET', 'POST'])
@login_required
@group_required
def getReportPat():
    if request.method == 'GET':
        return render_template('getReport.html', title='Поиск отчётов о зарегистрированных в отделении пациентах')
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        _sql = provider.get('reportPat.sql', year=year, month=month)
        getResult, getSchema = select(current_app.config['configDB'], _sql)
        if len(getResult) == 0:
            return render_template('getReport.html', title='Поиск отчётов о зарегистрированных в отделении пациентах', message='Отчёт не найден')
        return render_template('getReport.html', title='Поиск отчётов о зарегистрированных в отделении пациентах', message='Вывод найденного отчёта', schema=getSchema, result=getResult)

@report.route('/createReportPat', methods=['GET', 'POST'])
@login_required
@group_required
def createReportPat():
    if request.method == 'GET':
        return render_template('createReport.html', title='Создание отчётов о зарегистрированных в отделении пациентах')
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        _sql = provider.get('reportPat.sql', year=year, month=month)
        createResult, createSchema = select(current_app.config['configDB'], _sql)
        if year and month and len(createResult) == 0:
            year = int(year)
            month = int(month)
            id_dep = session['user_id']
            call_proc(current_app.config['configDB'], 'createReportPat', id_dep, year, month)
            _sql = provider.get('reportPat.sql', year=year, month=month)
            createResult, createSchema = select(current_app.config['configDB'], _sql)
            if len(createResult) == 0:
                return render_template('createReport.html', title='Создание отчётов о зарегистрированных в отделении пациентах', message='Не удалось создать отчёт')
            return render_template('createReport.html', title='Создание отчётов о зарегистрированных в отделении пациентах', message='Вывод созданного отчёта', schema=createSchema, result=createResult)
        return render_template('createReport.html', title='Создание отчётов о зарегистрированных в отделении пациентах', message='Такой отчёт уже существует')
@report.route('/getReportIns', methods=['GET', 'POST'])
@login_required
@group_required
def getReportIns():
    if request.method == 'GET':
        return render_template('getReport.html', title='Поиск отчётов о проведённых докторами отделения осмотрах')
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        _sql = provider.get('reportIns.sql', year=year, month=month)
        getResult, getSchema = select(current_app.config['configDB'], _sql)
        if len(getResult) == 0:
            return render_template('getReport.html', title='Поиск отчётов о проведённых докторами отделения осмотрах', message='Отчёт не найден')
        return render_template('getReport.html', title='Поиск отчётов о проведённых докторами отделения осмотрах', message='Вывод найденного отчёта', schema=getSchema, result=getResult)

@report.route('/createReportIns', methods=['GET', 'POST'])
@login_required
@group_required
def createReportIns():
    if request.method == 'GET':
        return render_template('createReport.html', title='Создание отчётов о проведённых докторами отделения осмотрах')
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        _sql = provider.get('reportIns.sql', year=year, month=month)
        createResult, createSchema = select(current_app.config['configDB'], _sql)
        if year and month and len(createResult) == 0:
            year = int(year)
            month = int(month)
            id_dep = session['user_id']
            call_proc(current_app.config['configDB'], 'createReportIns', id_dep, year, month)
            _sql = provider.get('reportIns.sql', year=year, month=month)
            createResult, createSchema = select(current_app.config['configDB'], _sql)
            if len(createResult) == 0:
                return render_template('createReport.html', title='Создание отчётов о проведённых докторами отделения осмотрах', message='Не удалось создать отчёт')
            return render_template('createReport.html', title='Создание отчётов о проведённых докторами отделения осмотрах', message='Вывод созданного отчёта', schema=createSchema, result=createResult)
        return render_template('createReport.html', title='Создание отчётов о проведённых докторами отделения осмотрах', message='Такой отчёт уже существует')