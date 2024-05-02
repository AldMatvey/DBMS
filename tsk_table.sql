--8(1)
--CREATE TABLE VisitsNoMoney (
--    user_id int,
--    cnt int
--);
--
--
--INSERT INTO VisitsNoMoney (cnt)
--SELECT(SELECT * FROM (SELECT COUNT(users.user_id) FROM users JOIN logs on users.user_id = logs.user_id  WHERE logs.bet = 0 GROUP BY logs.user_id))
--
--SELECT MIN(cnt) FROM VisitsNoMoney

--8(2)
--SELECT (SUM(win) + 0.0)/ Sum(bet) * 100 FROM logs

--8(3) БАЛАНС = ВИН - БЭТ
--SELECT user_id, (SUM(win) - Sum(bet)) FROM logs GROUP BY user_id 

--8(4)
--CREATE TABLE GamblingCities (
--    city Varchar,
--    cnt_wins int,
--    cnt_losses int
--);

--INSERT INTO GamblingCities (cnt_wins, cnt_losses, city)
--SELECT SUM(win), SUM(bet), geo FROM users JOIN logs ON users.user_id = logs.user_id GROUP BY geo

--SELECT City, MAX((cnt_wins + 0.0) / cnt_losses) * 100 FROM GamblingCities 

--8(5)
--CREATE TABLE HighestStaks (
 --   max_stak int,
 --  city VARCHAR
--);

--INSERT INTO HighestStaks (city, max_stak)
--SELECT geo, MAX(bet)  FROM logs JOIN users ON logs.user_id = users.user_id WHERE bet != 0

--SELECT city FROM HighestStaks

--8(6)


CREATE TABLE MamothEnterTime (
   time_enter time,
   user_id INT
);

CREATE TABLE MamothBetTime (
   time_bet time,
   user_id INT
);

INSERT INTO MamothEnterTime (time_enter, user_id)
SELECT MIN(time_log), user_id FROM LOGS WHERE bet = 0 GROUP By user_id

INSERT INTO MamothBetTime (time_bet, user_id)
SELECT MIN(time_log), user_id FROM LOGS WHERE bet != 0 GROUP By user_id

CREATE TABLE TimeBetweenBetAndEnter (
	t float
);


INSERT INTO TimeBetweenBetAndEnter (t)
SELECT julianday(datetime(time_bet)) - julianday(datetime(time_enter))
FROM MamothEnterTime JOIN MamothBetTime on MamothEnterTime.user_id = MamothBetTime.user_id 
GROUP By MamothBetTime.user_id

SELECT (AVG(t)) FROM TimeBetweenBetAndEnter

