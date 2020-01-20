#!/usr/bin/env python
# encoding: utf-8
#-*- coding=utf-8 -*-

from flask import Flask
import pymysql

app = Flask(__name__)

@app.route('/helloworld')
def helloworld():
    return "welcome"

@app.route('/selectAll')
def selectAll():
    conn = pymysql.connect(host='127.0.0.1', port=3306, user='root', passwd='root', db='helloworld', charset='utf8')
    cursor = conn.cursor()
    effect_row = cursor.execute("select * from helloworld")
    data = cursor.fetchall()
    print data[0][1] # 打印john
    return str(data)

if __name__ == '__main__':
    app.run(debug=True)