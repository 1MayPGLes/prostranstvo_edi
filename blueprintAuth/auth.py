import os
from flask import Blueprint, request, render_template, current_app
from funcDB import select
from SQLProvider import SQLProvider

auth = Blueprint('auth', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))