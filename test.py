from flask import json
from DB.funcDB import select

with open('data/configDB.json', 'r') as f:
    configDB = json.load(f)

product = f"""
            SELECT prod_name
            FROM product 
        """

productResult, productSchema = select(configDB, product)

productResult = [item[0] for item in productResult]

print(productResult)
print(productSchema)

skidki = f"""
            SELECT prod_name, prod_price, prod_img
            FROM product 
        """

skidkiResult, skidkiSchema = select(configDB, skidki)

print(skidkiResult)
print(skidkiSchema)