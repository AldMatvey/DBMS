import csv
import sqlite3
import sys
import requests


def main(fname):
    data = []
    with open(fname) as fin:
        for uid, email, geo in csv.reader(fin):
            uid = str(uid)
            geo = str(geo)
            print(uid[-3] + uid[-2] + uid[-1], email, geo)
            uid = uid[-3] + uid[-2] + uid[-1]
            if uid == '000':
                uid = '1000'
            uid = int(uid)
            data.append((uid, email, geo))
            data.sort()

    with sqlite3.connect('casino.s3db') as conn:
        cur = conn.cursor()
        i = 1
        for uid, email, geo in data:
            print("**")
            insert = f"({uid}, '{email}', '{geo}')"
            print(insert)
            sql = "INSERT INTO users (user_id, email, geo) VALUES " + insert
            cur.execute(sql)
        conn.commit()


if __name__ == '__main__':
    main(sys.argv[1])

