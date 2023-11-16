import os
from flask import Blueprint, request, render_template, current_app
from DB.funcDB import select, call_proc
from DB.SQLProvider import SQLProvider
from access import login_required, group_required

report = Blueprint('report', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

@report.route('/')
@login_required
@group_required
def reports():
    return render_template('report.html', title='Страница работы с отчётами')

@report.route('/get', methods=['GET', 'POST'])
@login_required
@group_required
def getReport():
    if request.method == 'GET':
        getResult, getSchema = select(current_app.config['configDB'], "select * from report")
        return render_template('getReport.html', title='Страница поиска отчётов', schema=getSchema, result=getResult)
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        _sql = provider.get('report.sql', year=year, month=month)
        getResult, getSchema = select(current_app.config['configDB'], _sql)
        return render_template('getReport.html', title='Страница поиска отчётов', schema=getSchema, result=getResult)

@report.route('/create', methods=['GET', 'POST'])
@login_required
@group_required
def createReport():
    if request.method == 'GET':
        return render_template('createReport.html', title='Страница создание отчётов')
    else:
        year = request.form.get('inputYear')
        month = request.form.get('inputMonth')
        if year and month:
            year = int(year)
            month = int(month)
            call_proc(current_app.config['configDB'], 'createReport', year, month)

        _sql = provider.get('report.sql', year=year, month=month)
        createResult, createSchema = select(current_app.config['configDB'], _sql)
        return render_template('createReport.html', title='Страница создание отчётов', schema=createSchema, result=createResult)