import psycopg2
from config import host, port, user, database, password
from flask import Flask, render_template, url_for, request, abort, flash, session, redirect

app = Flask(__name__)
app.config['SECRET_KEY'] = 'lj8fw3nd88fasf854hskm454hnpdvu4e8'

try:
    conn = psycopg2.connect(
        host=host,
        port=port,
        user=user,
        database=database,
        password=password
    )
    cur = conn.cursor()
    cur.execute('SELECT * FROM med_card;')
    result = cur.fetchall()
    print (result)
except Exception as err:
    print('[INFO] Error while working with PostgreSQL', err)
finally:
    if conn:
        cur.close()
        conn.close()
        print('[INFO] PostgreSQL connection closed')


@app.route('/')
def index():
    professions = ['Анестезиолог', 'Гнойный хирург', 'Кардиолог', 'ЛОР', 'Невролог', 'Нейро-Кардио хирург', 'Онколог', 'Офтальмолог', 'Пульмонолог', 'Реаниматолог', 'Терапевт', 'Травматолог', 'Травматолог-ортопед', 'Хирург', 'Эндокринолог']
    services = [
        {'name': 'Диагностика', 'img': 'skoraya.png'},
        {'name': 'Вызов врача на дом', 'img': 'Vyzov-vracha-na-dom.png'},
        {'name': 'Взрослая стоматология', 'img': 'Vzroslaya-stomatologiya.png'},
        {'name': 'Детская стоматология', 'img': 'Detskaya-stomatologiya.png'},
        {'name': 'Анализы', 'img': 'Analizy.png'},
        {'name': 'Комплексная программа', 'img': 'CHekapy.png'}
    ]
    doctors = [
        {'name': 'Бадыков Ильмир Ильдусович', 'info': 'Кардиолог, высшая категория, стаж 22 года', 'img': 'v_ded.jpg'},
        {'name': 'Гирфанова Элиана Булатовна', 'info': 'Анестезиолог, стаж 5 лет', 'img': 'v_elya.jpg'},
        {'name': 'Оганнисян Гамлет Ваганович', 'info': 'Пульмонолог, высшая категория, стаж 34 года', 'img': 'v_gamlet.jpg'},
        {'name': 'Ярмухаметов Ильфат Ленарович', 'info': 'Реаниматолог, стаж 18 лет', 'img': 'v_ilfat.jpg'},
        {'name': 'Долгов Илья Валерьевич', 'info': 'ЛОР, высшая категория, стаж 27 лет', 'img': 'v_kaban.jpg'},
        {'name': 'Кольчев Максим Леонидович', 'info': 'Кардиолог, стаж 3 года', 'img': 'v_kolchev.jpg'},
        {'name': 'Кожуров Матвей Вячеславович', 'info': 'Невролог, стаж 6 лет', 'img': 'v_mansur.jpg'},
        {'name': 'Бадретдинов Эмиль Рустемович', 'info': 'Офтальмолог, высшая категория, стаж 31 год', 'img': 'v_negr.jpg'},
        {'name': 'Киселёв Максим Ильич', 'info': 'Травматолог, стаж 7 лет', 'img': 'v_oleg.jpg'},
        {'name': 'Головин Павел Денисович', 'info': 'Хирург, высшая категория, стаж 19 лет', 'img': 'v_pashka.jpg'},
        {'name': 'Ерохин Савва Васильевич', 'info': 'Травматолог-ортопед, высшая категория, стаж 20 лет', 'img': 'v_savva.jpg'},
        {'name': 'Симонов Максим Сергеевич', 'info': 'Терапевт, стаж 8 лет', 'img': 'v_shaman.jpg'},
        {'name': 'Шпичко Алексей Дмитриевич', 'info': 'Гнойный хирург, стаж 3 года', 'img': 'v_sin.jpg'},
        {'name': 'Аверкиев Александр Максимович', 'info': 'Эндокринолог, высшая категория, стаж 22 года', 'img': 'v_slon.jpg'},
        {'name': 'Зуюнов Мухаммадаббос Азамович', 'info': 'Нейро-Кардио хирург, высшая категория, стаж 12 лет', 'img': 'v_tadj.jpg'},
        {'name': 'Треус Иван Сергеевич', 'info': 'Невролог, высшая категория, стаж 16 лет', 'img': 'v_trevis.jpg'},
        {'name': 'Бирюков Иван Дмитриевич', 'info': 'Онколог, высшая категория, стаж 14 лет', 'img': 'v_voin.jpg'}
    ]
    return render_template('index.html', title='Клиника «Измайловская» им. А.С. Багирова', services=services, professions=professions, doctors=doctors)

@app.route('/registration', methods=['POST'])
def registration():
    if request.form['username'] == "1_may" and request.form['password'] == "123":
        session['userLogged'] = request.form['username']
        return redirect(url_for('profile', username=session['userLogged']))
    return redirect(url_for('index'))

@app.route('/profile/<username>', methods=['POST', 'GET'])
def profile(username):
    if 'userLogged' not in session or session['userLogged'] != username:
        abort(401)
    return render_template('profile.html', title='Личный кабинет', username=session['userLogged'])

@app.errorhandler(404)
def page_not_found(error):
    return render_template('page_not_found.html', title='Cтраница не найдена')

@app.errorhandler(401)
def page_not_found(error):
    return render_template('unauthorized.html', title='Отказ в доступе')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)