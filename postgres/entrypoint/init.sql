CREATE USER jandev;
ALTER USER jandev with password 'admin1234';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO jandev;

CREATE USER aitordev;
ALTER USER aitordev with password 'admin1234';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO aitordev;
