from flask import Flask 

app = Flask(__name__)
app.config['SECRET_KEY'] = '6b34cb86b01197b548d9a959b8cba178'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://weblog:weblog@database-main:5432/weblog'


