import os
from flask import Blueprint, request, render_template, current_app, session, redirect, url_for
from DB.funcDB import select, call_proc
from DB.SQLProvider import SQLProvider
from access import login_required, group_required

report = Blueprint('report', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

report_list = [
    {'rep_name': 'Зарегистрированные в отделении пациенты', 'rep_id': '1'},
    {'rep_name': 'Проведённые докторами отделения осмотры', 'rep_id': '2'}
]

report_url = {
    '1': {'create_rep': 'report.create_rep1', 'view_rep': 'report.view_rep1'},
    '2': {'create_rep': 'report.create_rep2', 'view_rep': 'report.view_rep2'}
}

@report.route('/', methods=['GET', 'POST'])
@login_required
@group_required
def start_report():
    if request.method == 'GET':
        return render_template('menu_report.html', report_list=report_list)
    else:
        rep_id = request.form.get('rep_id')
        print('rep_id = ', rep_id)
        if request.form.get('create_rep'):
            url_rep = report_url[rep_id]['create_rep']
        else:
            url_rep = report_url[rep_id]['view_rep']
        print('url_rep = ', url_rep)
        return redirect(url_for(url_rep))

@report.route('/create_rep1', methods=['GET', 'POST'])
@login_required
@group_required
def create_rep1():
    if request.method == 'GET':
        return render_template('createReport.html', title='Создание отчётов о зарегистрированных в отделении пациентах')
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        if (len(year) == 0) or (len(month) == 0):
            message = 'Ошибка ввода. Заполните оба поля'
            return render_template('createReport.html', title='Создание отчётов о зарегистрированных в отделении пациентах', message=message)
        if (year.isdigit() != True) or (month.isdigit() != True):
            message = 'Ошибка ввода'
            return render_template('createReport.html', title='Создание отчётов о зарегистрированных в отделении пациентах', message=message)
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

@report.route('/view_rep1', methods=['GET', 'POST'])
@login_required
@group_required
def view_rep1():
    if request.method == 'GET':
        return render_template('getReport.html', title='Поиск отчётов о зарегистрированных в отделении пациентах')
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        if (len(year) == 0) or (len(month) == 0):
            message = 'Ошибка ввода. Заполните оба поля'
            return render_template('getReport.html', title='Просмотр отчётов о зарегистрированных в отделении пациентах', message=message)
        if (year.isdigit() != True) or (month.isdigit() != True):
            message = 'Ошибка ввода'
            return render_template('getReport.html', title='Просмотр отчётов о зарегистрированных в отделении пациентах', message=message)
        _sql = provider.get('reportPat.sql', year=year, month=month)
        getResult, getSchema = select(current_app.config['configDB'], _sql)
        if len(getResult) == 0:
            message = 'Отчёт не найден'
            return render_template('getReport.html', title='Просмотр отчётов о зарегистрированных в отделении пациентах', message=message)
        message = 'Вывод найденного отчёта'
        return render_template('getReport.html', title='Просмотр отчётов о зарегистрированных в отделении пациентах', message=message, schema=getSchema, result=getResult)

@report.route('/create_rep2', methods=['GET', 'POST'])
@login_required
@group_required
def create_rep2():
    if request.method == 'GET':
        return render_template('createReport.html', title='Создание отчётов о проведённых докторами отделения осмотрах')
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        if (len(year) == 0) or (len(month) == 0):
            message = 'Ошибка ввода. Заполните оба поля'
            return render_template('createReport.html', title='Создание отчётов о проведённых докторами отделения осмотрах', message=message)
        if (year.isdigit() != True) or (month.isdigit() != True):
            message = 'Ошибка ввода'
            return render_template('createReport.html', title='Создание отчётов о проведённых докторами отделения осмотрах', message=message)
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

@report.route('/view_rep2', methods=['GET', 'POST'])
@login_required
@group_required
def view_rep2():
    if request.method == 'GET':
        return render_template('getReport.html', title='Просмотр отчётов о проведённых докторами отделения осмотрах')
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        if (len(year) == 0) or (len(month) == 0):
            message = 'Ошибка ввода. Заполните оба поля'
            return render_template('getReport.html', title='Просмотр отчётов о проведённых докторами отделения осмотрах', message=message)
        if (year.isdigit() != True) or (month.isdigit() != True):
            message = 'Ошибка ввода'
            return render_template('getReport.html', title='Просмотр отчётов о проведённых докторами отделения осмотрах', message=message)
        _sql = provider.get('reportIns.sql', year=year, month=month)
        getResult, getSchema = select(current_app.config['configDB'], _sql)
        if len(getResult) == 0:
            message = 'Отчёт не найден'
            return render_template('getReport.html', title='Просмотр отчётов о проведённых докторами отделения осмотрах', message=message)
        message = 'Вывод найденного отчёта'
        return render_template('getReport.html', title='Просмотр отчётов о проведённых докторами отделения осмотрах', message=message, schema=getSchema, result=getResult)
