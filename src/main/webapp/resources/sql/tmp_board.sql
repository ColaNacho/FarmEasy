CREATE TABLE tmp_board (
    board_id INT PRIMARY KEY,
    m_id VARCHAR2(20) NOT NULL,    
    fe_type VARCHAR2(3) DEFAULT 'N',
    board_title VARCHAR2(100) NOT NULL,
    board_content VARCHAR2(1000) DEFAULT NULL,
    insert_date VARCHAR2(10) DEFAULT TO_CHAR(sysdate, 'yyyy.mm.dd'),
    update_date VARCHAR2(10) DEFAULT TO_CHAR(sysdate, 'yyyy.mm.dd'),
    board_hits INT DEFAULT 0,
    bGroup NUMBER(4),
    bStep Number(4),
    bIndent NUMBER(4)
);


-- BOARD_CATEGORY 테이블 샘플 데이터
INSERT INTO tmp_board (board_id, m_id, fe_type, board_title, board_content, board_hits, bGroup, bStep, bIndent)
VALUES(1, 'nacho', 'N', '테스트1', '테스트1', 0,0,0,0);
INSERT INTO tmp_board (board_id, m_id, fe_type, board_title, board_content, board_hits, bGroup, bStep, bIndent)
VALUES(2, 'nacho', 'N', '테스트2', '테스트2', 0,0,0,0);

create sequence board_id start with 1 increment by 1;

select *
from tmp_board;

drop table tmp_board;