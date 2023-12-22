@report.route('/create_rep1', methods=['GET', 'POST'])
@login_required
@group_required
def create_rep1():
    if request.method == 'GET':
        print("GET_create")
        return render_template('report_create.html', name_rep="выручке с фильма", title='Отчет 1')
    else:
        print(current_app.config['db_config'])
        print("POST_create")
        try:
            rep_month = int(request.form.get('input_month'))
            rep_year = int(request.form.get('input_year'))
        except ValueError:
            return render_template('error.html', error="Параметры отчёта введены неверно! "
                                                           "Введите год в формате XXXX, месяц в формате XX")
        print("Loading...")
        if rep_year and rep_month and 2000 < rep_year <= 2023 and 0 < rep_month <= 12:
            _sql = provider.get('check_rep1.sql', in_year=rep_year, in_month=rep_month)
            product_result, schema = select(current_app.config['db_config'], _sql)
            print(product_result)
            if (product_result[0][0] > 0):
                return render_template('error.html', error="Такой отчёт уже существует")
            else:
                res = call_proc(current_app.config['db_config'], 'stonks_report', rep_year, rep_month)
                print('res=', res)
                return render_template('report_created.html', rep_month=rep_month, rep_year=rep_year, name_rep="выручке с фильма")
        else:
            return render_template('error.html', error="Вы допустили ошибку! "
                                                           "Введите год в формате XXXX, месяц в формате XX")


@report.route('/view_rep1', methods=['GET', 'POST'])
@login_required
@group_required
def view_rep1():
    if request.method == 'GET':
        return render_template('view_rep.html', name_rep='выручке с фильма')
    else:
        try:
            rep_month = int(request.form.get('input_month'))
            rep_year = int(request.form.get('input_year'))
        except ValueError:
            return render_template('error.html', error="Параметры запроса введены неверно! "
                                                           "Введите год в формате XXXX, месяц в формате XX")
        if rep_year and rep_month and 2000 < rep_year <= 2023 and 0 < rep_month <= 12:
            _sql = provider.get('rep1.sql', in_year=rep_year, in_month=rep_month)
            product_result, schema = select(current_app.config['db_config'], _sql)
            if product_result:
                return render_template('result_rep1.html', schema=schema, result=product_result, rep_month=rep_month, rep_year=rep_year)
            else:
                return render_template('error.html', error="Такой отчёт не был создан")
        else:
            return render_template('error.html', error="Вы допустили ошибку! "
                                                           "Введите год в формате XXXX, месяц в формате XX")

@report.route('/create_rep2', methods=['GET', 'POST'])
@login_required
@group_required
def create_rep2():
    if request.method == 'GET':
        print("GET_create")
        return render_template('report_create.html', name_rep="выручке с зала", title='Отчет 2')
    else:
        try:
            rep_month = int(request.form.get('input_month'))
            rep_year = int(request.form.get('input_year'))
        except ValueError:
            return render_template('error.html', error="Параметры запроса введены неверно! "
                                                           "Введите год в формате XXXX, месяц в формате XX")
        if rep_year and rep_month and 2000 < rep_year <= 2023 and 0 < rep_month <= 12:
            _sql = provider.get('check_rep2.sql', in_year=rep_year, in_month=rep_month)
            product_result, schema = select(current_app.config['db_config'], _sql)
            print(product_result)
            if (product_result[0][0] > 0):
                return render_template('error.html', error="Такой отчёт уже существует")
            else:
                res = call_proc(current_app.config['db_config'], 'places_report', rep_year, rep_month)
                print('res=', res)
                return render_template('report_created.html', rep_month=rep_month, rep_year=rep_year, name_rep="выручке с зала")
        else:
            return render_template('error.html', error="Вы допустили ошибку! "
                                                           "Введите год в формате XXXX, месяц в формате XX")

@report.route('/view_rep2', methods=['GET', 'POST'])
@login_required
@group_required
def view_rep2():
    if request.method == 'GET':
        return render_template('view_rep.html', name_rep="выручке с зала")
    else:
        try:
            rep_month = int(request.form.get('input_month'))
            rep_year = int(request.form.get('input_year'))
        except ValueError:
            return render_template('error.html', error="Параметры запроса введены неверно! "
                                                           "Введите год в формате XXXX, месяц в формате XX")
        if rep_year and rep_month and 2000 < rep_year <= 2023 and 0 < rep_month <= 12:
            _sql = provider.get('rep2.sql', in_year=rep_year, in_month=rep_month)
            product_result, schema = select(current_app.config['db_config'], _sql)
            if product_result:
                return render_template('result_rep1.html', schema=schema, result=product_result, rep_month=rep_month, rep_year=rep_year)
            else:
                return render_template('error.html', error="Такой отчёт не был создан")
        else:
            return render_template('error.html', error="Вы допустили ошибку! "
                                                           "Введите год в формате XXXX, месяц в формате XX")