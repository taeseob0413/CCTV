create table ChildBoard_table (
    child_id number not null,
    child_location varchar2(100),
    child_age number(5),
    child_gender varchar2(2),
    child_name varchar2(25),
    child_height float(10),
    child_time DATE,
    child_feature varchar2(50),
    child_outfit varchar2(50)
);

--기본키 설정
alter table ChildBoard_table add constraint cd_pk primary key (child_id);

create table USER_TABLE (
    user_id number(5) not null,
    user_name varchar2(25),
    user_email varchar2(50),
    user_loginID varchar2(30),
    user_password varchar2(100),
    user_age number(5),
    user_gender varchar2(10),
    user_address varchar2(100),
    user_grade varchar2(10)
);

--기본키 설정
alter table USER_TABLE add constraint user_pk primary key (user_id);