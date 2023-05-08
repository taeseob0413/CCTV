1. application.properties 작성(위치 : src/main/resources/application.properties)
```properties
spring.datasource.driver-class-name=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@(사용하는 오라클 주소 입력)
spring.datasource.username=(데이터베이스 아이디)
spring.datasource.password=(데이터베이스 비밀번호)

mybatis.mapper-locations=classpath:/mapper/*.xml
server.servlet.jsp.init-parameters.development=true 

spring.mvc.view.prefix=/WEB-INF/
spring.mvc.view.suffix=.jsp

server.port=80

gmail.email = (서버 내부에서 사용할 이메일 아이디)
gmail.password = (서버 내부에서 사용할 이메일 어플리케이션 비밀번호)
```
1-1. 데이터베이스 주소 설정
* 로컬 오라클 사용 시 주소(1521은 오라클 기본 포트번호 필요 시 변경)
```properties
spring.datasource.url = jdbc:oracle:thin:@localhost:1521:xe
```
* 오라클 클라우드의 자율운영데이터베이스 사용 시 설정
* 자율운영데이터베이스 생성 후 설정 > 네트워크 > 엑세스 제어목록 > 서버 IP 등록
* 데이터베이스 설정 > 데이터베이스 접속 > TLS 선택 > 복사
```properties
spring.datasource.url=jdbc:oracle:thin:@(description= (retry_count=??)(retry_delay=?)(address=(protocol=????)(port=1521)(-------))(connect_data=(service_name=------------------))(security=(??????)))
```

1-2. 데이터베이스 테이블 생성
```SQL
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

alter table USER_TABLE add constraint user_pk primary key (user_id);

alter table user_table modify user_grade default 'Bronze';

create SEQUENCE seq_user;
```
```SQL
--ReportBoard
create table ReportBoard_table (report_id number not null, child_name varchar2(10),
child_age number, child_gender varchar2(10),
report_time DATE default sysdate, 
report_address varchar2(50), report_content varchar2(1000), 
user_id number, user_loginId varchar2(20), child_id number, password varchar2(10),
approval number default 0);

alter table ReportBoard_table add constraint rp_pk primary key (report_id);

-- 글 고유 번호를 생성
create sequence seq_reportboard;
```

```sql
--ChildBoard
CREATE TABLE childboard_table (
  child_id number NOT NULL PRIMARY KEY,
  child_location VARCHAR(1000),
  child_curage VARCHAR(100),
  child_occage VARCHAR(100),
  child_gender VARCHAR(20),
  child_name VARCHAR(100),
  child_time VARCHAR(50),
  child_feature VARCHAR(1000),
  child_outfit VARCHAR(1000),
  child_img VARCHAR(1000)
);
-- 글 고유 번호를 생성
create sequence seq_child;
```

```sql
--ProtectBoard
create table ProtectBoard_table (protect_id number not null, child_name varchar2(10),
                                 child_age number, child_gender varchar2(10),
                                 child_hometown varchar2(100), child_findlocation varchar2(100), protect_time DATE default sysdate,
                                 protect_address varchar2(50), protect_content varchar2(1000),
                                 user_phone varchar2(30), user_loginId varchar2(20), child_id number default 0, password varchar2(10),
                                 approval number default 0);

alter table ProtectBoard_table add constraint pt_pk primary key (protect_id);

create sequence seq_protectboard;

alter table protectboard_table
    add (ispr number default 0);

alter table protectboard_table drop column ispr;
alter table protectboard_table drop column child_id;
```

```sql
--ProtectRelation
create table protectRelation (
pr_id number not null primary key,
protect_id number,
child_id number);

create sequence seq_pr;
```
```sql
CREATE TABLE FAMILY_RELATION_TABLE(
	ID NUMBER, 
	USER_ID NUMBER, 
	CHILDBOARD_ID NUMBER, 
	APPROVAL NUMBER
);

create sequence seq_familyRelation;
```
```sql
create sequence seq_safetymap;

create table safetymap_table (
safety_id number(5),
safety_name varchar2(100),
safety_address varchar2(200),
safety_latitude float,
safety_longitude float,
safety_class varchar2(100),
safety_telno varchar2(50)
);
```
1-3. 서버 관리자 이메일 등록
* 구글 앱 비밀번호 발급
```md
Google 계정 앱 비밀번호 생성하기

1. [Google 계정](https://myaccount.google.com/)으로 이동합니다.
2. **보안**을 선택합니다.
3. 'Google에 로그인'에서 **앱 비밀번호**를 선택합니다. 이때 로그인해야 할 수 있습니다. 이 옵션이 표시되지 않는다면 다음과 같은 이유일 수 있습니다.
    1. 계정에 2단계 인증이 설정되어 있지 않습니다.
    2. 보안 키에만 2단계 인증이 설정되었습니다.
    3. 직장, 학교 및 기타 조직을 통해 계정을 사용 중입니다.
    4. 고급 보호를 사용 설정했습니다.
4. 하단의 **앱 선택**에서 사용 중인 앱을 선택한 후  **기기 선택**에서 사용 중인 기기를 선택하고  **생성**을 선택합니다.
5. 안내에 따라 앱 비밀번호를 입력합니다. 앱 비밀번호는 기기의 노란색 바에 표시된 16자 코드입니다.
6. **완료**를 탭합니다.
```

1-4. 데이터베이스에 실종아동 및 안전지도 정보 추가
* 실종 아동 : 프로젝트 실행 후, (/childapi/childboard)으로 GET 요청.(1분 이내 소요)
* 안전 지도 : 프로젝트 실행 후, (/api/safemap)으로 GET 요청.(2분 이상 소요)