from DB.connDB import DBContextManager

def select(configDB: dict, sql: str) -> dict:
    result = []
    schema = []
    with DBContextManager(configDB) as cursor:
        if cursor is None:
            raise ValueError('Курсор не создан')

        cursor.execute(sql)
        schema = [column[0] for column in cursor.description]
        for row in cursor.fetchall():
            result.append(row)

    return result, schema

def select_dict(configDB: dict, sql: str) -> dict:
    result = []
    with DBContextManager(configDB) as cursor:

        if cursor is None:
            raise ValueError('Курсор не создан')

        cursor.execute(sql)
        schema = [column[0] for column in cursor.description]

        for row in cursor.fetchall():
            result.append(dict(zip(schema, row)))
    return result

def insert(configDB: dict, sql: str) -> dict:
    with DBContextManager(configDB) as cursor:
        done = False
        if cursor is None:
            raise ValueError('Курсор не создан')

        cursor.execute(sql)

        if cursor.rowcount == 1:
            print("Данные успешно добавлены в таблицу")
            done = True
        else:
            print("Произошла ошибка при добавлении данных")
    return done

def call_proc(configDB: dict, proc_name: str, *args):
    with DBContextManager(configDB) as cursor:
        if cursor is None:
            raise ValueError('Курсор не создан')

        param_tuple = []
        for arg in args:
            param_tuple.append(arg)

        print("tuple: ", param_tuple)
        print("proc_name", proc_name)
        res = cursor.callproc(proc_name, param_tuple)
    return res