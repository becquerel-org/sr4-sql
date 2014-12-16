from config import *
import sqlite3
from contextlib import closing
from flask import Flask, request, session, g, redirect, url_for, \
             abort, render_template, flash

app = Flask(__name__)
app.config.from_object(__name__)

def connect_db():
    return sqlite3.connect(app.config['DATABASE'])

def init_db():
    with closing(connect_db()) as db:
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()
        g.db.row_factory = sqlite3.Row

@app.before_request
def before_request():
    g.db = connect_db()

@app.teardown_request
def teardown_request(exception):
    db = getattr(g, 'db', None)
    if db is not None:
        db.close()


def query_db(query, args=(), one=False):
    cur = get_db().execute(query, args)
    rv = cur.fetchall()
    cur.close()
    return (rv[0] if rv else None) if one else rv


@app.route('/')
def show_entries():
    render_template('show_entries.html', query_db('select name from characters'))

if __name__ == '__main__':
    app.run(host='0.0.0.0')
