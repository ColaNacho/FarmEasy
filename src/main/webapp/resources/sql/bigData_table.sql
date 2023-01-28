create table bigData_table(
    products_num int primary key,
    products_date date,
    products_name varchar2(20) not null,
    products_price varchar2(20),
    products_pre varchar2(20) not null,
    products_month varchar2(20) not null,
    products_avg varchar2(20) not null,
    products_predict varchar2(50) not null,
    products_per varchar2(20) not null,
    products_graph varchar2(20) not null
);

create sequence bigData_seq start with 1 increment by 1;

Drop table bigData_table;

drop SEQUENCE bigData_seq;

    products_num int - 시퀀스
    products_date - 날짜
    products_name varchar2(20) - 품목명
    products_price varchar2(20) - 해당 일자 가격
    products_pre varchar2(20) - 전일 가격
    products_month varchar2(20) - 월간 평균 가격
    products_avg varchar2(20) - 가격예측(7일평균)
    products_predict varchar2(50) - 예측가격변동률
    products_per varchar2(20) - 퍼센트
    products_graph varchar2(20) - 그래프보기