CREATE TABLE policy_table (
    policy_id INT PRIMARY KEY,
    sido VARCHAR2(20),
    sigungu VARCHAR2(20),
    policy_name VARCHAR2(100),
    target_requirement VARCHAR2(4000) DEFAULT ' ',
    policy_content VARCHAR2(4000) DEFAULT ' ',
    subsidy VARCHAR2(4000) DEFAULT ' ',
    department_tel VARCHAR2(1000) DEFAULT ' '
);

create sequence policy_seq start with 1 increment by 1;

Drop table policy_table;

drop SEQUENCE policy_seq;