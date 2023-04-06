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


create table SAFEFYMAP_TABLE (
    map_id number not null,
    map_name varchar2(20),
    map_phone varchar2(20),
    map_address varchar2(100),
    map_type varchar2(10)
);

--기본키 설정
alter table SAFEFYMAP_TABLE add constraint map_pk primary key (map_id);

create table UndefinedBoard_table (
    Ud_id number not null,
    udreport_time DATE, 
    udreport_address  VARCHAR(50),
    udreport_content VARCHAR(255),
    undefined_name VARCHAR(25),
    undefined_age number(5),
    user_id number
);

--기본키 설정
alter table UndefinedBoard_table add constraint ud_pk primary key (Ud_id);

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

create table ReportBoard_table (
    report_id number not null,
    report_time DATE,
    report_address varchar2(50),
    report_content varchar2(255),
    user_id number,
    child_id number
);

--기본키 설정
alter table ReportBoard_table add constraint rp_pk primary key (report_id);

create table Notice_table (
    notice_id number not null,
    notice_content varchar2(1000)
);

--기본키 설정
alter table Notice_table add constraint no_pk primary key (notice_id);

--참조키 설정(reportboard_table - userID 참조키 설정)
ALTER TABLE ReportBoard_table
ADD CONSTRAINT FK_user FOREIGN KEY(user_id) REFERENCES USER_TABLE (user_id);

--참조키 설정(reportboard_table - child_id 참조키 설정)
ALTER TABLE ReportBoard_table
ADD CONSTRAINT FK_child FOREIGN KEY(user_id) REFERENCES ChildBoard_table (child_id);

--참조키 설정(UndefinedBoard_table - user_ud 참조키 설정)
ALTER TABLE UndefinedBoard_table 
ADD CONSTRAINT FK_user2 FOREIGN KEY(user_id) REFERENCES USER_TABLE (user_id);
