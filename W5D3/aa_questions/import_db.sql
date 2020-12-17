PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies; /*lets us run the file multiple times and start fresh
(create table from scratch) each time we run the file*/
DROP TABLE IF EXISTS question_follows; /*Drop all joins table first b/c they are referencing other tables. Can't dop the other tables 
if something is refrencing them*/ 
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY, 
    fname TEXT NOT NULL,
    lname TEXT NOT NULL /*NO TRAILING COMMAS!!*/
); /*REMEMBER THE SEMICOLON!!*/

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body VARCHAR(255),
    users_id INTEGER,

    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER,
    questions_id INTEGER,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)

);
CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT,
    users_id INTEGER,
    parent_reply_id INTEGER,
    subject_question_id INTEGER,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (parent_reply_id) REFERENCES parent_reply_id,
    FOREIGN KEY (subject_question_id) REFERENCES subject_question(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    users_id INTEGER,
    questions_id INTEGER,

      FOREIGN KEY (users_id) REFERENCES users(id),
      FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO 
    users(fname, lname) /*specifies the order we will be supplying values in below*/
VALUES 
    ('Jadin','Press');  /*,...; <- if you want to add more make sure you separte by commas and end list with semicolon*/

INSERT INTO 
    questions(title, body, users_id) /*specifies the order we will be supplying values in below*/
VALUES 
    ('Some Stupid Question','Blah Blah Blah', (SELECT id FROM users WHERE fname = 'Jadin' AND lname = 'Press'));

-- INSERT INTO 
--     question_follows(users_id, questions_id) /*specifies the order we will be supplying values in below*/
-- VALUES 
--     (9573, 0274);

-- INSERT INTO 
--     users(fname, lname,) /*specifies the order we will be supplying values in below*/
-- VALUES 
--     ('Jadin','Press')

-- INSERT INTO 
--     users(fname, lname,) /*specifies the order we will be supplying values in below*/
-- VALUES 
--     ('Jadin','Press')