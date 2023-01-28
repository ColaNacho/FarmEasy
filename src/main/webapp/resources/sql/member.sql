create table TB_MEMBER(
    m_seq int not null primary key,
    m_name varchar2(15) not null,
    m_Id varchar2(20) not null,
    m_pw varchar2(30) not null,
    m_email VARCHAR2(50) not null,
    m_mobile VARCHAR2(20) not null,
    m_authority VARCHAR2(3) DEFAULT 'N',
    m_date DATE DEFAULT SYSDATE,
    m_score varchar2(10)
);

alter table  TB_MEMBER ADD (m_score varchar2(10));

create SEQUENCE m_seq start with 1 INCREMENT by 1;


drop table TB_MEMBER;

drop sequence m_seq;

create table info_table(
    info_id int primary key,
    info_do varchar(20) not null,
    info_sido varchar(20) not null,
    info_name varchar2(50) not null,
    info_heart varchar(20) not null
);
create sequence info_id start with 1 increment by 1;

drop SEQUENCE info_id;

select *
from info_table;

drop table info_table;

insert into info_table values (1, '충청남도', '공주시', '2022 귀농귀촌인 공주탐험대 운영' , '♡');
insert into info_table values (2, '충청남도', '공주시', '2022 귀농귀촌인 역량강화 교육' , '♡');
insert into info_table values (3, '충청남도', '태안군', '귀농귀촌 동네작가 운영' , '♡');
insert into info_table values (4, '충청북도', '영동군', '2022년 청년 귀농귀촌 동아리 지원' , '♡');
insert into info_table values (5, '충청북도', '영동군', '2022년 귀농 주택구입신축 융자사업' , '♡');