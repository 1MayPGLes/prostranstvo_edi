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

productResult = [item[0] for item in productResult]

print(productResult)

skidki = f"""
            SELECT prod_name, prod_price, prod_img
            FROM product 
        """

skidkiResult = select(configDB, skidki)

print(skidkiResult)
print(skidkiResult[0][0])