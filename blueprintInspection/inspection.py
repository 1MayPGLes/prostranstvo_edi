import os
from flask import Blueprint, request, render_template, current_app, session
from DB.funcDB import insert
from DB.SQLProvider import SQLProvider
from access import login_required, group_required

inspection = Blueprint('inspection', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))

@inspection.route('/', methods=['GET', 'POST'])
@login_required
@group_required
def setInspection():
    if request.method == 'GET':
        return render_template('inspection.html', title='Назначение осмотров')
    else:
        inputMed_card = request.form.get('inputMed_card')
        inputVerdict = request.form.get('inputVerdict')
        if len(inputMed_card) == 0:
            message = 'Введите номер медицинской карты пациента'
            return render_template('inspection.html', title='Назначение осмотров', message=message)
        if len(inputVerdict) == 0:
            message = 'Введите вердикт осмотра'
            return render_template('inspection.html', title='Назначение осмотров', message=message)
        if inputMed_card.isdigit() != True:
            message = 'Ошибка ввода номера медицинской карты'
            return render_template('inspection.html', title='Назначение осмотров', message=message)
        if (len(inputMed_card) != 0) and (len(inputVerdict) != 0) and (inputMed_card.isdigit() == True):
            _sql = provider.get('setInspection.sql', inputVerdict=inputVerdict, inputDoc=session['user_id'], inputMed_card=int(inputMed_card))
            done = insert(current_app.config['configDB'], _sql)
            if done == False:
                message = 'Произошла ошибка при добавлении записи об осмотре, проверьте правильность ввода данных'
                return render_template('inspection.html', title='Назначение осмотров', message=message)
            message = 'Запись успешно добавлена'
            return render_template('inspection.html', title='Назначение осмотров', message=message)