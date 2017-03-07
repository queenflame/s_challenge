#!/usr/bin/python3

import MySQLdb


def setup_data(db):
    cur = db.cursor()
    cur.execute(" INSERT INTO brand (name) VALUES ('Cafe Bangarang') ")

def fetch_prices(db):
   # you must create a Cursor object. It will let
    #  you execute all the queries you need
    cur = db.cursor()

    # Use all the SQL you like
    cur.execute("SELECT name from brand")

    # print all the first cell of all the rows
    for row in cur.fetchall():
        print(row[0])


def teardown_data(db):
    cur = db.cursor()
    cur.execute(" delete from brand;")


if __name__ == "__main__":
    db = MySQLdb.connect(host="localhost",  # your host, usually localhost
                         user="root",  # your password
                         db="salido_challenge")  # name of the data base
    setup_data(db)
    fetch_prices(db)
    teardown_data(db)
    db.close()
