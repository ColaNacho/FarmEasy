CREATE TABLE fe_board (
    board_id INT PRIMARY KEY,
--    user_id INT NOT NULL,
--    user_name VARCHAR2(10) NOT NULL,
    user_idName VARCHAR2(20) NOT NULL,    
    
    fe_type VARCHAR2(3) DEFAULT 'N',
    board_title VARCHAR2(100) NOT NULL,
    board_content VARCHAR2(1000) DEFAULT NULL,
--    insert_date DATE DEFAULT sysdate,
    insert_date VARCHAR2(10) DEFAULT TO_CHAR(sysdate, 'yyyy.mm.dd'),

    update_date VARCHAR2(10) DEFAULT TO_CHAR(sysdate, 'yyyy.mm.dd'),
    board_hits INT DEFAULT 0
);

create sequence fe_board_seq start with 1 increment by 1;

Drop table fe_board;

drop SEQUENCE fe_board_seq;


--
CREATE TABLE fe_reply (
    reply_id INT PRIMARY KEY,
    board_id INT NOT NULL,
    user_idName VARCHAR2(20) NOT NULL,
    reply_bundle INT NOT NULL,
    reply_order INT DEFAULT 0,
    reply_level INT DEFAULT 0,
    reply_content VARCHAR2(100) DEFAULT NULL,
    insert_date DATE DEFAULT sysdate,
    update_date DATE DEFAULT NULL
);

create sequence fe_reply_seq start with 1 increment by 1;

Drop table fe_reply;

drop SEQUENCE fe_reply_seq;



--
CREATE TABLE fe_board_file (
    board_file_id INT PRIMARY KEY,
    board_id INT NOT NULL,
    board_file_name VARCHAR2(100) NOT NULL,
    board_file_realName VARCHAR2(100),
    board_file_byte VARCHAR2(20)
);

create sequence fe_board_file_seq start with 1 increment by 1;

Drop table fe_board_file;

drop SEQUENCE fe_board_file_seq;