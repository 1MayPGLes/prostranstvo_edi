import pymysql
from config import host, port, user, password, database
from funcDB import select

configDB = {
    'host': host,
    'port': port,
    'user': user,
    'password': password,
    'database': database
}

product = f"""
            SELECT prod_name
            FROM product 
        """
productResult = select(configDB, product)

print(productResult)