from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def handler():
    return render_template('index.html')


@app.route('/dynamic')
def dynamic_content_handler():
    username = 'Sanya'
    orders = [
        {'owner': username, 'total': 100},
        {'owner': username, 'total': 130},
        {'owner': username, 'total': 150},
    ]
    context = {
        'username': username,
        'orders': orders
    }
    return render_template('dynamic_index.html', content=context)


@app.route('/greeting')
def greeting_handler():
    return 'Hello new user'


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000)