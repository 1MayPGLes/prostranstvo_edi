from flask import Flask, render_template, json, session
from blueprintReport.report import report
from blueprintQuery.query import query
from blueprintAuth.auth import auth
from blueprintInspection.inspection import inspection
from blueprintAccount.account import account
from blueprintBasket.basket import basket
from access import login_required
app = Flask(__name__, template_folder='templates', static_folder="static")
app.secret_key = 'lj8fw3nd88fasf854hskm454hnpdvu4e8'

app.register_blueprint(report, url_prefix='/report')
app.register_blueprint(query, url_prefix='/query')
app.register_blueprint(auth, url_prefix='/auth')
app.register_blueprint(account, url_prefix='/account')
app.register_blueprint(inspection, url_prefix='/inspection')
app.register_blueprint(basket, url_prefix='/basket')

app.config['configDB'] = json.load(open('data/configDB.json'))
app.config['access'] = json.load(open('data/access.json'))
app.config['cache'] = json.load(open('data/cache.json'))

@app.route('/')
@login_required
def index():
    if session['user_group'] == 'doctor':
        return render_template('doctor.html', title='Клиника «Измайловская» им. А.С. Багирова')
    if session['user_group'] == 'head':
        return render_template('head.html', title='Клиника «Измайловская» им. А.С. Багирова')
    return render_template('patient.html', title='Клиника «Измайловская» им. А.С. Багирова')

@app.route('/exit')
@login_required
def exit():
    session.clear()
    return render_template('exit.html', title='Выход из системы')

@app.errorhandler(404)
@login_required
def page_not_found(error):
    return render_template('page_not_found.html', title='Cтраница не найдена')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5500, debug=True)