#!/usr/bin/python3

import MySQLdb


def setup_data(db):
    cur = db.cursor()
    cur.execute(" INSERT INTO brand (name) VALUES ('Cafe Bangarang') ")

def fetch_prices(db):
    cur = db.cursor()
    cur.execute("SELECT name from brand")
    for row in cur.fetchall():
        print(row[0])

def teardown_data(db):
    cur = db.cursor()
    cur.execute(" delete from brand;")

if __name__ == "__main__":
    db = MySQLdb.connect(host="localhost",
                         user="root",
                         db="salido_challenge")
    setup_data(db)
    fetch_prices(db)
    teardown_data(db)
    db.close()
