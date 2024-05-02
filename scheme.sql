CREATE table logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    time_log VARCHAR,
    bet INTEGER,
    win INTEGER
);

CREATE table users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    email VARCHAR,
    geo VARCHAR 
);
