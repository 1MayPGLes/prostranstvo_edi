from DB.connDB import DBContextManager

def select(db_config: dict, sql: str) -> dict:
    result = []
    schema = []
    with DBContextManager(db_config) as cursor:
        if cursor is None:
            raise ValueError('Курсор не создан')

        cursor.execute(sql)
        schema = [column[0] for column in cursor.description]
        for row in cursor.fetchall():
            result.append(row)

    return result, schema

def select_dict(db_config: dict, sql: str) -> dict:
    result = []
    with DBContextManager(db_config) as cursor:

        if cursor is None:
            raise ValueError('Курсор не создан')

        cursor.execute(sql)
        schema = [column[0] for column in cursor.description]

        for row in cursor.fetchall():
            result.append(dict(zip(schema, row)))
    # print(f"result_dict: {result}")
    return result

def select(db_config: dict, sql: str) -> dict:
    result = []
    schema = []
    with DBContextManager(db_config) as cursor:
        if cursor is None:
            raise ValueError('Курсор не создан')

        cursor.execute(sql)
        schema = [column[0] for column in cursor.description]
        for row in cursor.fetchall():
            result.append(row)

    return result, schema