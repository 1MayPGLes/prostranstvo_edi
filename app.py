from flask import Flask, render_template, url_for, request, abort, flash, session, redirect

app = Flask(__name__)
app.config['SECRET_KEY'] = 'lj8fw3nd88fasf854hskm454hnpdvu4e8'

@app.route('/', methods=['POST', 'GET'])
def index():
    if request.method == 'POST' and request.form['username'] == "1_may" and request.form['password'] == "123":
        session['userLogged'] = request.form['username']
        return redirect(url_for('profile', username=session['userLogged']))

    professions = ['Анестезиолог', 'Гнойный хирург', 'Кардиолог', 'ЛОР', 'Невролог', 'Нейро-Кардио хирург', 'Онколог', 'Офтальмолог', 'Пульмонолог', 'Реаниматолог', 'Терапевт', 'Травматолог', 'Травматолог-ортопед', 'Хирург', 'Эндокринолог']
    doctors = [
        {'name': 'Бадыков Ильмир Ильдусович', 'info': 'Кардиолог, высшая категория, стаж 22 года', 'img': 'v_ded'},
        {'name': 'Гирфанова Элиана Булатовна', 'info': 'Анестезиолог, стаж 5 лет', 'img': 'v_elya'},
        {'name': 'Оганнисян Гамлет Ваганович', 'info': 'Пульмонолог, высшая категория, стаж 34 года', 'img': 'v_gamlet'},
        {'name': 'Ярмухаметов Ильфат Ленарович', 'info': 'Реаниматолог, стаж 18 лет', 'img': 'v_ilfat'},
        {'name': 'Долгов Илья Валерьевич', 'info': 'ЛОР, высшая категория, стаж 27 лет', 'img': 'v_kaban'},
        {'name': 'Кольчев Максим Леонидович', 'info': 'Кардиолог, стаж 3 года', 'img': 'v_kolchev'},
        {'name': 'Кожуров Матвей Вячеславович', 'info': 'Невролог, стаж 6 лет', 'img': 'v_mansur'},
        {'name': 'Бадретдинов Эмиль Рустемович', 'info': 'Офтальмолог, высшая категория, стаж 31 год', 'img': 'v_negr'},
        {'name': 'Киселёв Максим Ильич', 'info': 'Травматолог, стаж 7 лет', 'img': 'v_oleg'},
        {'name': 'Головин Павел Денисович', 'info': 'Хирург, высшая категория, стаж 19 лет', 'img': 'v_pashka'},
        {'name': 'Ерохин Савва Васильевич', 'info': 'Травматолог-ортопед, высшая категория, стаж 20 лет', 'img': 'v_savva'},
        {'name': 'Симонов Максим Сергеевич', 'info': 'Терапевт, стаж 8 лет', 'img': 'v_shaman'},
        {'name': 'Шпичко Алексей Дмитриевич', 'info': 'Гнойный хирург, стаж 3 года', 'img': 'v_sin'},
        {'name': 'Аверкиев Александр Максимович', 'info': 'Эндокринолог, высшая категория, стаж 22 года', 'img': 'v_slon'},
        {'name': 'Зуюнов Мухаммадаббос Азамович', 'info': 'Нейро-Кардио хирург, высшая категория, стаж 12 лет', 'img': 'v_tadj'},
        {'name': 'Треус Иван Сергеевич', 'info': 'Невролог, высшая категория, стаж 16 лет', 'img': 'v_trevis'},
        {'name': 'Бирюков Иван Дмитриевич', 'info': 'Онколог, высшая категория, стаж 14 лет', 'img': 'v_voin'}
    ]
    return render_template('index.html', professions=professions, doctors=doctors)

@app.route('/profile/<username>', methods=['POST', 'GET'])
def profile(username):
    if 'userLogged' not in session or session['userLogged'] != username:
        abort(401)

    return f"Профиль пользователя: {username}"

@app.route('/greeting')
def greeting_handler():
    return 'Hello new user'

@app.errorhandler(404)
def page_not_found(error):
    return render_template('page_not_found.html', title='Cтраница не найдена')

@app.errorhandler(401)
def page_not_found(error):
    return render_template('unauthorized.html', title='Отказ в доступе')


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)