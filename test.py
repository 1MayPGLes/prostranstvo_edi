from flask import json
from DB.funcDB import select, insert

with open('data/configDB.json', 'r') as f:
    configDB = json.load(f)

# product = f"""
#             SELECT prod_name
#             FROM product
#         """
#
# productResult, productSchema = select(configDB, product)
#
# productResult = [item[0] for item in productResult]
#
# print(productResult)
# print(productSchema)


specialist = f"""
                SELECT *
                FROM doctor
                WHERE id_doc=123124312
            """
specialistResult, specialistSchema = select(configDB, specialist)

specialistResult = [item[0] for item in specialistResult]

print(specialistResult)
print(specialistSchema)
print(len(specialistResult))

x = 5
y = "Hello, world!"
z = 3.14
a = None

print(isinstance(x, int))    # True
print(isinstance(y, str))    # True
print(isinstance(z, float))  # True
print(a)  # True

def choose_noun_form(age):
    last_two_digits = age % 100

    if 11 <= last_two_digits <= 19:
        return "лет"
    last_digit = last_two_digits % 10
    if last_digit == 1:
        return "год"
    if 2 <= last_digit <= 4:
        return "года"
    return "лет"

print(choose_noun_form(1))
print(choose_noun_form(14))
print(choose_noun_form(21))
print(choose_noun_form(24))
print(choose_noun_form(27))