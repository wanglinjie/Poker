#-*- coding: utf-8 -*-

import logging
logging.basicConfig(level=logging.INFO)

import MySQLdb

def get_conn():
    return MySQLdb.connect(host='localhost', user='root', passwd='123', db='poker')

def get_cursor(conn):
    return conn.cursor()

def close(cursor, conn):
    cursor.close()
    conn.close()

def decode(w):
    try:
        return w.decode('gb2312').encode('utf-8'), 1
    except:
        logging.warning(w)
        return w, -1

DATA_DIR = './data/'
FILES = ['学院教师.TXT', '本科生.TXT', '机关部处.TXT']

SQL_FORMAT = "INSERT INTO wizard(wizard_id, wizard_name) VALUES('%s', '%s');"

conn = get_conn()
cursor = get_cursor(conn)

for data_file in FILES:
    file_path = DATA_DIR + data_file
    logging.info(file_path)
    with open(file_path) as f:
        for line in f:
            line, r = decode(line)
            if r == -1:
                continue
            wizard_name, wizard_id = line.split(',')
            sql = SQL_FORMAT % (wizard_id.strip(), wizard_name.strip())
            try:
                cursor.execute(sql)
            except Exception, e:
                logging.warn(e)
conn.commit()
close(cursor, conn)
