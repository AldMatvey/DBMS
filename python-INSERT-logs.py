import csv
import sqlite3
import sys


def main(fname):
    data = []
    with open(fname) as fin:
        for uid, time_log, bet, win in csv.reader(fin):
            uid = str(uid)
            time_log = str(time_log)
            bet = str(bet)
            win = str(win)
            if uid == '#error':
                continue
            if bet == '':
                bet = 0
            if win == '':
                win = 0
            win = int(win)
            bet = int(bet)
            print(uid[-3] + uid[-2] + uid[-1], time_log, bet, win)
            uid = uid[-3] + uid[-2] + uid[-1]
            if uid == '000':
                uid = '1000'
            uid = int(uid)
            data.append((uid, time_log[1::], bet, win))
        data.sort()

    with sqlite3.connect('dev-casino.s3db') as conn:
        cur = conn.cursor()
        print("**")
        i = 1
        for uid, time_log, bet, win in data:
            insert = f"({uid}, '{time_log}', {bet}, {win})"
            sql = "INSERT INTO logs (user_id, time_log, bet, win) VALUES " + insert
            cur.execute(sql)
        conn.commit()


if __name__ == '__main__':
    main(sys.argv[1])

