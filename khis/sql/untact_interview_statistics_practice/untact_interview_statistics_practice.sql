-- zoom이 삭제되면 면접자/면접관 정보 쪽에서 줌 회의실 정보 삭제(null처리)
create or replace trigger trg_zoom_del
    after
    delete on zoom
    for each row
begin
    update ir_info set zoom_no = null where zoom_no = :old.zoom_no;
end;

insert INTO zoom (zoom_no, member_no, co_code, api_key, api_secret, jwt_token)
values (10, 1, 1, 10, 10, 10);
insert INTO zoom (zoom_no, member_no, co_code, api_key, api_secret, jwt_token)
values (11, 1, 1, 11, 11, 11);



select
    z.*
from
   (    
    select
        z.*, m.name, m.role
    from
        zoom z left join ir_info m on z.zoom_no = m.zoom_no
    where
        z.member_no = 1
    ) z
;

--delete from ir_info;

INSERT INTO
ir_info
(MEMBER_INFO_NO,MEMBER_NO, CO_CODE, INTERVIEW_NO, NAME, EMAIL, PHONE, CATETORY, ROLE,ZOOM_NO, IR_PATH_CODE, INTERVIEWER_INFO_NO)
values (111,111,1,1,'김일일','kimbh666@naver.com','01012341234','U','R',1, null,null)
;
INSERT INTO
ir_info
(MEMBER_INFO_NO,MEMBER_NO, CO_CODE, INTERVIEW_NO, NAME, EMAIL, PHONE, CATETORY, ROLE,ZOOM_NO, IR_PATH_CODE, INTERVIEWER_INFO_NO)
values (222,222,1,1,'김이이','kimbh666@naver.com','01012341234','U','I',1, null,null)
;
INSERT INTO
ir_info
(MEMBER_INFO_NO,MEMBER_NO, CO_CODE, INTERVIEW_NO, NAME, EMAIL, PHONE, CATETORY, ROLE, ZOOM_NO, IR_PATH_CODE, INTERVIEWER_INFO_NO)
values (333,333,1,1,'김삼삼','kimbh666@naver.com','01012341234','U','I',1, null,null)
;
update ir_info set zoom_no = 10;
--select * from member;
--update member set kind = 'IR_SUPERVISOR';
--commit;

ALTER TABLE ir_info MODIFY interview_no NULL;

update ir_info set interview_no = null
where role = 'R';
commit;


alter table zoom add zoom_number number null;
alter table zoom add zoom_password varchar2(1000) null;
COMMENT ON COLUMN  zoom . zoom_number  IS 'zoom 회의실번호';
COMMENT ON COLUMN  zoom . zoom_password  IS 'zoom 회의실비밀번호';
ALTER TABLE zoom MODIFY zoom_number VARCHAR2(50);

alter table zoom add zoom_url varchar2(1000) null;
COMMENT ON COLUMN  zoom . zoom_url  IS 'zoom 연결링크';


insert INTO zoom (zoom_no, member_no, co_code, api_key, api_secret, jwt_token ,zoom_number,zoom_password,zoom_url)
values (12, 1, 1,  'FeyWs7fdRDe8JYUCrSEldw', 'gNWS2i0PD8P9uyFcR4bIDP0yW8hktyGDLjtl','', '87156082004','UUlpUHB6a29PeGl3R3VuSzFnalU5Zz09' , null);
commit;

update zoom set jwt_token = 12 where zoom_no = 12;
update ir_info set zoom_no = 10;


select rpad(substr(api_key, 1, 5), length(api_key), '*') from zoom
;
    select
        z.zoom_no, z.member_no, z.co_code, rpad(substr(z.api_key, 1, 5), length(z.api_key), '*') as api_key, 
        z.api_secret, z.jwt_token, z.zoom_number, z.zoom_password, m.name, m.role, m.interview_no
    from
        zoom z left join ir_info m on z.zoom_no = m.zoom_no
        ;
        
drop table INTERVIEWER_career;
drop table INTERVIEWER_INFO_CAREER;
drop table INTERVIEWER_CERTIFICATER;
drop table INTERVIEWER_INFO_CERTIFICATE;
drop table INTERVIEWER_INFO;


CREATE TABLE  Interviewer_Info  (
	 INTERVIEWER_INFO_NO 	NUMBER		NULL,
	 self_introduction 	VARCHAR2(2000)		NULL,
	 image 	varchar2(200)		NULL
);

COMMENT ON COLUMN  Interviewer_Info . INTERVIEWER_INFO_NO  IS '면접자 정보 번호';

COMMENT ON COLUMN  Interviewer_Info . self_introduction  IS '자기소개서';

COMMENT ON COLUMN  Interviewer_Info . image  IS '면접자 사진';

ALTER TABLE  Interviewer_Info  ADD CONSTRAINT  PK_INTERVIEWER_INFO  PRIMARY KEY (
	 INTERVIEWER_INFO_NO 
);

CREATE TABLE  INTERVIEWER_career  (
	 career_NO 	NUMBER		NOT NULL,
	 INTERVIEWER_INFO_NO 	NUMBER		NULL,
	 company_NAME 	VARCHAR2(100)		NULL,
	 CAREER_term 	NUMBER		NULL,
	 CAREER_START_TIME 	DATE		NULL,
	 CAREER_END_TIME 	DATE		NULL
);

COMMENT ON COLUMN  INTERVIEWER_career . career_NO  IS '경력 번호';

COMMENT ON COLUMN  INTERVIEWER_career . INTERVIEWER_INFO_NO  IS '면접자 정보 번호';

COMMENT ON COLUMN  INTERVIEWER_career . company_NAME  IS '회사 이름';

COMMENT ON COLUMN  INTERVIEWER_career . CAREER_term  IS '경력 기간';

COMMENT ON COLUMN  INTERVIEWER_career . CAREER_START_TIME  IS '활동시작일';

COMMENT ON COLUMN  INTERVIEWER_career . CAREER_END_TIME  IS '활동 종료일';

ALTER TABLE  INTERVIEWER_career  ADD CONSTRAINT  PK_INTERVIEWER_CAREER  PRIMARY KEY (
	 career_NO ,
	 INTERVIEWER_INFO_NO 
);

ALTER TABLE  INTERVIEWER_career  ADD CONSTRAINT  FK_Interviewer_Info_TO_INTERVIEWER_career_1  FOREIGN KEY (
	 INTERVIEWER_INFO_NO 
)
REFERENCES  Interviewer_Info  (
	 INTERVIEWER_INFO_NO 
);

DROP TABLE INTERVIEWER_certificate;
CREATE TABLE  INTERVIEWER_certificate  (
	 certificate_NO 	NUMBER		NULL,
	 INTERVIEWER_INFO_NO 	NUMBER		NULL,
	 certificate_NAME 	VARCHAR2(100)		NULL,
	 certificate_issuer 	VARCHAR2(100)		NULL,
	 certificate_DATE 	DATE		NULL
);

COMMENT ON COLUMN  INTERVIEWER_certificate . certificate_NO  IS '자격증 번호';

COMMENT ON COLUMN  INTERVIEWER_certificate . INTERVIEWER_INFO_NO  IS '면접자 정보 번호';

COMMENT ON COLUMN  INTERVIEWER_certificate . certificate_NAME  IS '자격증 이름';

COMMENT ON COLUMN  INTERVIEWER_certificate . certificate_issuer  IS '자격증 발행처';

COMMENT ON COLUMN  INTERVIEWER_certificate . certificate_DATE  IS '자격증 발행 날짜';

ALTER TABLE  INTERVIEWER_certificate  ADD CONSTRAINT  PK_INTERVIEWER_CERTIFICATE  PRIMARY KEY (
	 certificate_NO ,
	 INTERVIEWER_INFO_NO 
);

ALTER TABLE  INTERVIEWER_certificate  ADD CONSTRAINT  FK_Interviewer_Info_TO_INTERVIEWER_certificate_1  FOREIGN KEY (
	 INTERVIEWER_INFO_NO 
)
REFERENCES  Interviewer_Info  (
	 INTERVIEWER_INFO_NO 
);

--drop table interview_Question;
CREATE TABLE interview_Question (
	question_no	number		NOT NULL,
	question_kind	char(1)		NOT NULL,
	question	varchar2(100)		NOT NULL,
	answer	varchar2(1000)		NULL,
	answer_keyword	varchar2(1000)		NULL,
    language_kind	varchar2(100)		NULL,
    
	Admin_Approval	char(1)	DEFAULT 'n'	NOT NULL
);

COMMENT ON COLUMN interview_Question.question_no IS '면접 연습 번호';

COMMENT ON COLUMN interview_Question.question_kind IS '면접 연습 종류';

COMMENT ON COLUMN interview_Question.question IS '면접 질문';

COMMENT ON COLUMN interview_Question.answer IS '질문 답변';

COMMENT ON COLUMN interview_Question.answer_keyword IS '질문 답변 키워드';

COMMENT ON COLUMN interview_Question.language_kind IS '개발자 면접 연습 언어 종류';

COMMENT ON COLUMN interview_Question.Admin_Approval IS '관리자 승인 여부';

ALTER TABLE interview_Question ADD CONSTRAINT PK_INTERVIEW_QUESTION PRIMARY KEY (
	question_no
);
--kind는 D/B로 구분
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind, Admin_Approval) 
values (1, 'D','JAVA 언어의 장점을 세가지만 설명해주세요.','운영체제에 독립적이다.,객체지향 언어이다.,자동으로 메모리관리를 해준다.,오픈소스JDK이다. 멀티스레드를 쉽게 구현할 수 있다.,동적로딩을 지원한다.','독립적,객체지향,메모리 관리,오픈소스,멀티스레드,동적로딩','java','y');

insert into interview_Question (question_no, question_kind, question, answer, answer_keyword,language_kind, Admin_Approval) 
values (2,'D','OOP의 네가지 특징은 무엇인가요?','추상화 : 구체적인 사물들의 공통적인 특징을 파악해서 이를 하나의 개념(집합)으로 다루는 것,캡슐화 : 정보 은닉(information hiding): 필요가 없는 정보는 외부에서 접근하지 못하도록 제한하는 것이다.,일반화 관계 : 여러 개체들이 가진 공통된 특성을 부각시켜 하나의 개념이나 법칙으로 성립시키는 과정이다.,다형성 : 서로 다른 클래스의 객체가 같은 메시지를 받았을 때 각자의 방식으로 동작하는 능력이다.','추상화,캡슐화,일반화 관계, 다향성','java','y')
;

insert into interview_Question (question_no, question_kind, question, answer, answer_keyword,language_kind, Admin_Approval) 
values (3,'D','final 키워드에 대해서 설명해주세요.','변수나 메서드 또는 클래스가 변경 불가능 하도록 만든다.','변경 불가능','java','y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword,language_kind, Admin_Approval) 
values (4,'D','오버로딩에 대해서 설명해주세요.','두 메서드가 같은 이름을 갖고 있으나 인자의 수나 자료형이 다른 경우를 뜻한다.','같은 이름,자료형,인자의 수','java','y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword,language_kind, Admin_Approval) 
values (5,'D','MVC패턴에 대해서 설명해 주세요.','모델, 뷰, 컨트롤러로 구성되어 비즈니스 로직을 서로 영향없이 쉽게 고칠 수 있는 패턴이다.','모델,뷰,컨트롤러,영향없이','java','y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (6,'D','mybatis에 대해서 설명해 주세요.','자바의 관계형 데이터베이스 프로그래밍을 조금 더 쉽게할 수 있도록 도와주는 프레임워크이다.','관계형,데이터베이스,쉽게,도와주는','java','y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (7,'D','JDBC란 무엇인가요?','자바에서 데이터베이스를 사용할 수 있도록 연결해주는 응용프로그램 인터페이스이다.','자바에서,데이터베이스,연결,응용프로그램','java','y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (8,'D','AJAX란 무엇인가요?','자바스크립트를 사용한 비동기 통신 기술로, 서버와 클라이언트 간 XML 데이터를 주고받는 기술이다.','비동기 통신, XML, 자바스크립트, 서버와 클라이언트','java','y')
;


insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (9,'B','자기소개 해주세요.',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (10,'B','차별화된 본인의 강점을 설명해주세요.',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (19,'B','왜 저희회사에 지원하셨나요?',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (11,'B','저희 회사에 와본 적 있나요?',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (12,'B','직무가 적성에 맞지 않는다면 어떻게 할건가요?',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (13,'B','인사란 무엇인가요?',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (14,'B','지원한 직무에 전공이 어떻게 도움이 될거라고 생각하나요?',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (15,'B','지원한 직무와 다른 부서에 배치된다면 어떻게 할건가요?',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (16,'B','자신의 취미 혹은 특기가 무엇인가요?',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (17,'B','경험해본 일탈에 대해서 설명해주세요.',null,null,null,'y')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (18,'B','졸업 후 공백기간 동안 무엇을 했나요?',null,null,null,'y')
;

insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (22,'B','파견근무에 대해서 어떻게 생각하시나요?',null,null,null,'n')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (20,'B','10년 후 자신의 모습에 대해서 이야기해주세요.',null,null,null,'n')
;
insert into interview_Question (question_no, question_kind, question, answer, answer_keyword, language_kind,Admin_Approval) 
values (21,'B','야근과 주말 근무에 대해 어떻게 생각하시나요?',null,null,null,'n')
;
commit;

select
    *
from
    interview_Question
where 
    question_kind = 'B'
    ;
    
update
    ir_info
set
    zoom_no = 12
;
commit;


  	select
  		*
  	from
  		interview_Question
	where
		question_kind = 'D' and admin_Approval = 'y'
  			and question_no not in (1,2)

;
select
    *
from
    interview_Question
order by admin_approval;

update interview_Question set answer = '모델 뷰 컨트롤러로 구성되어 비즈니스 로직을 서로 영향없이 쉽게 고칠 수 있는 패턴이다.' where question_no =5;

update interview_Question set admin_approval = 'n' where question_no in (18,19,20)
;
commit;

delete from interview_Question where question = '1234';
commit;

COMMENT ON COLUMN INTERVIEW.content IS '면접 질문 내용';

CREATE TABLE assigned_Info (
	assigned_no	number		NOT NULL,
	MEMBER_INFO_NO	number		NOT NULL,
	assigned_interviewer	number		NULL,
	Field2	VARCHAR(255)		NULL
);

COMMENT ON COLUMN assigned_Info.assigned_no IS '배정번호';

COMMENT ON COLUMN assigned_Info.MEMBER_INFO_NO IS '회원 번호 (SEQ 적용 필요)';

COMMENT ON COLUMN assigned_Info.assigned_interviewer IS '배정된면접관';

ALTER TABLE assigned_Info ADD CONSTRAINT PK_ASSIGNED_INFO PRIMARY KEY (
	assigned_no,
	MEMBER_INFO_NO
);

ALTER TABLE assigned_Info ADD CONSTRAINT FK_IR_INFO_TO_assigned_Info_1 FOREIGN KEY (
	MEMBER_INFO_NO
)
REFERENCES IR_INFO (
	MEMBER_INFO_NO
);

delete from zoom where zoom_no in (10,11,13);
rollback;
insert INTO zoom (zoom_no, member_no, co_code, api_key, api_secret, jwt_token ,zoom_number,zoom_password,zoom_url)
values (14, 1, 1,  '14', '14','', '14','14' , null);
commit;
insert INTO zoom (zoom_no, member_no, co_code, api_key, api_secret, jwt_token ,zoom_number,zoom_password,zoom_url)
values (15, 1, 1,  '15', '15','', '15','15' , null);
commit;
insert INTO zoom (zoom_no, member_no, co_code, api_key, api_secret, jwt_token ,zoom_number,zoom_password,zoom_url)
values (16, 1, 1,  '16', '16','', '16','16' , null);
commit;

update ir_info set zoom_no = 12 where member_no in (111,222,333);

select
  		*
  	from
  		zoom
  	where
  		member_no = 1
        ;
    
    select
    *, WM_CONCAT()
    from
     zoom
     ;
     
     select
	 		count(*)
	 	from
	 		interview_Question
	 	 WHERE  question_kind = 'D'
	 	order by 
	 		admin_approval
            ;
select count(*)
from
	 		interview_Question
	 	 WHERE  question_kind in ('D') 
	 	order by 
	 		admin_approval
    ;
    
alter table interview_Question modify question_kind varchar2(1);
alter table interview_Question modify admin_approval varchar2(1);

--alter table zoom drop column JWT_TOKEN;
--alter table zoom drop column ZOOM_URL;
--alter table ASSIGNED_INFO drop column FIELD2;
select * 
from 
    ir_info i join zoom z on i.zoom_no = z.zoom_no
;
    select
        z.zoom_no, z.member_no, z.co_code, z.api_key, 
        z.api_secret, z.zoom_number, z.zoom_password, m.name, m.role, m.interview_no
    from
        ir_info m join zoom z on z.zoom_no = m.zoom_no
    where
        m.member_no = 111
;
select * from member;
select * from ir_info;
update ir_info set member_no = 111 where member_no = 1;
select * from zoom;
update ir_info set zoom_number = '3112655091' , zoom_password = 'zts6vp' where zoom_no = 12;



INSERT INTO
pass_comment
(MEMBER_INFO_NO,MEMBER_NO, CO_CODE, INTERVIEW_NO, NAME, EMAIL, PHONE, CATETORY, ROLE, ZOOM_NO, IR_PATH_CODE, INTERVIEWER_INFO_NO)
values (333,333,1,1,'김삼삼','kimbh666@naver.com','01012341234','U','I',1, null,null)
;

COMMENT ON COLUMN ir_info.ssn IS '주민번호';

-- 나이별 합격자 쿼리
-- 맨처음에 회사 코드 코드와 이름이 주어지고, 
-- 회사를 선택하면 해당 부분에 대한 합격률 등장
-- 합격률은 나이별 / 경력별이 있어야되는데
-- 한번에 가져오기 시도
-- 나이는 ir_info테이블에서 ssn 가져와서 구하고
--

select i.member_info_no, i.member_no, i.co_code, i.interview_no, 
EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(i.ssn,8,1),'1', '19','2','19','20') || SUBSTR(i.ssn,1,2)) +1  as age,
nvl(a.career_sum,0), pc.passcheck
from ir_info i left join pass_comment pc 
on i.member_info_no = pc.member_info_no
left join (select interviewer_info_no, sum(round(career_end_time - career_start_time,2)) as career_sum from interviewer_career group by interviewer_info_no
) a on i.interviewer_info_no = a.interviewer_info_no
where i.member_no = 100;

update interviewer_career set career_end_time = sysdate;
update ir_info set ssn = '981212-1231231' where member_no in (111,333,100);
update ir_info set ssn = '881212-1231231' where member_info_no in (7,4,3);
update ir_info set co_code = 1 where member_info_no in (7,11,4,9,3);
commit;
-- 먼저 총 경력
select interviewer_info_no, sum(round(career_start_time - career_end_time,2)) from interviewer_career group by interviewer_info_no
;

-- 각자 총 경력 sum 구하기

INSERT INTO
ir_info
(MEMBER_INFO_NO,MEMBER_NO, CO_CODE, INTERVIEW_NO, NAME, EMAIL, PHONE, CATEGORY, ROLE, ZOOM_NO, IR_PATH_CODE, INTERVIEWER_INFO_NO)
values (100,100,1,1,'김삼삼','kimbh666@naver.com','01012341234',null,'I',1, null,null)
;
commit;

select i.member_info_no, i.member_no, i.co_code, i.interview_no, 
EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(i.ssn,8,1),'1', '19','2','19','20') || SUBSTR(i.ssn,1,2)) +1  as age,
nvl(a.career_sum,0), pc.passcheck
from ir_info i left join pass_comment pc 
on i.member_info_no = pc.member_info_no
left join (select interviewer_info_no, sum(round(career_end_time - career_start_time,2)) as career_sum from interviewer_career group by interviewer_info_no
) a on i.interviewer_info_no = a.interviewer_info_no
;

-- 경력 별 쪼개기
select 
nvl(a.career_sum,0) as career_sum, 

pc.final_pass_check as passcheck
,i.co_code, 
count(*) as count
--select *
from ir_info i 
left join interview iw on i.member_info_no = iw.imember_info_no
left join (select interviewer_info_no, sum(round(career_end_time - career_start_time,0)) as career_sum from interviewer_career group by interviewer_info_no
) a on i.interviewer_info_no = a.interviewer_info_no
left join pass_yn pc 
on i.member_info_no = pc.member_info_no

where i.co_code = 1
group by career_sum,            pc.final_pass_check, i.co_code
;

-- 나이 별 쪼개기
select
*
from (
select 

(mod((EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(i.ssn,8,1),'1', '19','2','19','20') || SUBSTR(i.ssn,1,2))+1),10)*10) as age,

pc.passcheck,
i.co_code, 
count(*) as count

from ir_info i left join pass_comment pc 
on i.member_info_no = pc.member_info_no
left join (select interviewer_info_no, sum(round(career_end_time - career_start_time,0)) as career_sum from interviewer_career group by interviewer_info_no
) a on i.interviewer_info_no = a.interviewer_info_no

where i.co_code = '1'
group by mod((EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(i.ssn,8,1),'1', '19','2','19','20') || SUBSTR(i.ssn,1,2))+1),10)*10,pc.passcheck,i.co_code
)
order by age
;

INSERT INTO
pass_comment
(comment_NO,MEMBER_info_NO, member_no, CO_CODE, passcheck)
values (100,111,111,1,'y');
INSERT INTO
pass_comment
(comment_NO,MEMBER_info_NO, member_no, CO_CODE, passcheck)
values (333,333,333,1,'n')
;
commit;

drop table board_company_question;


create or replace trigger boardchecktrigger
    after
    pass_comment
    for each row
declare

begin
    insert pass_board_score (1, (select sum()))
end

select * from pass_comment

select sum(value)
from (
        select
            ie.*, pc.*
        from
            pass_comment pc left join interview i
                        on pc.member_info_no = i.imember_info_no
                        left join interview_evaluate ie
                        on i.interview_no = ie.interview_no
                        where ie.member_info_no = 21

);

drop table pass_yn;
CREATE TABLE  pass_yn  (
	 pass_no 	number		NOT NULL,
	 MEMBER_INFO_NO 	number		NOT NULL,
	 co_code 	number		NULL,
	 pass_check 	varchar2(1)		NULL,
	 reg_date 	date	DEFAULT sysdate	NULL,
	 board_write_yn 	varchar2(1)	DEFAULT 'n'	NULL
);

COMMENT ON COLUMN  pass_yn . pass_no  IS '최종합격 번호';

COMMENT ON COLUMN  pass_yn . MEMBER_INFO_NO  IS '회원번호(면접자)';

COMMENT ON COLUMN  pass_yn . co_code  IS '회사 코드';

COMMENT ON COLUMN  pass_yn . pass_check  IS '최종합격여부';

COMMENT ON COLUMN  pass_yn . reg_date  IS '최종평가날짜';

COMMENT ON COLUMN  pass_yn . board_write_yn  IS '게시글 작성여부';

ALTER TABLE  pass_yn  ADD CONSTRAINT  PK_PASS_YN  PRIMARY KEY (
	 pass_no ,
	 MEMBER_INFO_NO 
);

ALTER TABLE  pass_yn  ADD CONSTRAINT  FK_IR_INFO_TO_pass_yn_1  FOREIGN KEY (
	 MEMBER_INFO_NO 
)
REFERENCES  IR_INFO  (
	 MEMBER_INFO_NO 
);

select
    count(*)
from(
    select
    a.member_info_no, i.name
    from assigned_info a left join ir_info i 
        on a.member_info_no = i.member_info_no
    where
        i.co_code = 1
    group by a.member_info_no,i.name);

select
    count(distinct name) as count
from assigned_info a left join ir_info i 
    on a.member_info_no = i.member_info_no
where
    i.co_code = 1;
    
-- 면접자에 대한 면접관들의 평가 PASSCHECK 가져오기
SELECT * 
FROM assigned_Info a left join pass_comment p
    on a.member_info_no = p.member_info_no 
    and a.assigned_interviewer = p.imember_info_no;
SELECT 
    a.*, i.co_code, p.passcheck, py.FINAL_PASS_CHECK
    FROM assigned_Info a 
    left join ir_info i on a.member_info_no = i.member_info_no
    left join pass_comment p
        on a.member_info_no = p.member_info_no 
        and a.assigned_interviewer = p.imember_info_no
    left join pass_yn py on py.member_info_no = p.member_info_no
        
    where a.member_info_no = 21 and i.co_code = 1;
    
    
    select
        i.interview_no as interview_no,
        i.title as title,
        i.content as content,
        i.imember_info_no,
        ie.member_info_no as member_info_no,
        ie.evaluate_no as evaluate_no,
        nvl(ie.evaluate_value, 0) as evaluate_value,
        nvl(ie.evaluate_comment, '') as evaluate_comment,
        pc.passcheck as passcheck
     from
        interview i left join interview_evaluate ie
        on i.interview_NO = ie.interview_NO left join pass_comment pc
        on i.imember_info_no = pc.member_info_no
      WHERE i.imember_info_no = '21' 
      
         and ie.member_info_no = 43
         ;
select 
        i.interview_no as interview_no,
        i.title as title,
        i.content as content,
        i.imember_info_no as 면접자,
        ie.member_info_no as 평가쪽면접관,
        ie.evaluate_no as evaluate_no,
        nvl(ie.evaluate_value, 0) as evaluate_value,
        nvl(ie.evaluate_comment, '') as evaluate_comment,
        pc.passcheck as passcheck
from
    interview i left join interview_evaluate ie
    on i.interview_NO = ie.interview_NO 
    left join pass_comment pc      on ie.member_info_no = pc.imember_info_no
          WHERE i.imember_info_no = '21' 
      
         and ie.member_info_no = 43;
         
select
        ir.*,
        pc.passcheck
     from
        ir_info ir left join assigned_info ass
        on ir.member_info_no = ass.member_info_no
        left join pass_comment pc on ass.assigned_interviewer = pc.imember_info_no and ass.member_info_no = pc.member_info_no
     where
        ass.assigned_interviewer = 43;
        
        
-- fk 묶인 부분 없애기
CREATE TABLE  premium  (
	 premium_no 	number		NOT NULL,
	 MEMBER_NO 	number		NOT NULL,
	 reg_date 	date		NULL,
	 month 	number		NULL,
	 end_yn 	varchar2(1)	DEFAULT 'n'	NULL,
	 payment 	number		NULL
);

COMMENT ON COLUMN  premium . premium_no  IS '프리미언 이용 여부 번호';

COMMENT ON COLUMN  premium . MEMBER_NO  IS '회원번호(sequence)';

COMMENT ON COLUMN  premium . reg_date  IS '가입날짜';

COMMENT ON COLUMN  premium . month  IS '프리미엄 유지 개월';

COMMENT ON COLUMN  premium. end_yn  IS '종료 여부(n,y)';

COMMENT ON COLUMN  premium . payment  IS '결제금액';

ALTER TABLE  premium  ADD CONSTRAINT  PK_premium  PRIMARY KEY (
	 premium_no 
);

        
create or replace procedure update_premium_procedure
is
begin
    update premium set end_yn = 'n' where ADD_MONTHS(reg_date, month) <= sysdate;
    commit;
end;
--
--begin
--dbms_scheduler.create_job(
--    jonupdate_premium_job,
--    'update_premium_procedure()',
--    systimestamp,
--    null,
--    'freq = daily; byhour23 byminute=58;';
--    '매일 23시 58분에 프리미엄 시작시작으로부터 1달이 넘으면 end_yn부분 n으로 변경 update 실행'
--);
--end;  


begin

dbms_scheduler.create_job(
    job_name => 'update_premium_job',
    job_type => 'plsql_block',
    job_action => 'begin update_premium_procedure; end;'
    start_date => systimestamp,
    end_date => null,
    repeat_interval => 'freq = daily; byhour23 byminute=58;');
    comments => '매일 23시 58분에 프리미엄 시작시작으로부터 1달이 넘으면 end_yn부분 n으로 변경 update 실행');
    end;  
    /
)


select py.*, mc.*
from pass_yn py  left join  member_company mc on mc.co_code = py.co_code
where py.board_write_yn = 'n' and member_info_no = #{member_info_no}
;
select * from member m join ir_info ii on m.member_no = ii.member_no
where ii.member_info_no = 21;



/* 제품 삭제시 판매제품 글의 게시글 삭제여부 변경 트리거 product_writing_yn = 'y' */
create or replace trigger trg_member_del
    after
        delete on member /*member에서 데이터가 삭제된 후에 실행*/
        for each row
begin
    update product_writing 
    set product_writing_yn = 'y' 
    where id = :old.id;
end;

/* 후기삭제시 pass_yn의 후기 작성한 부분 다시 작성 가능하게 여부 변경 트리거 board_write_yn = 'n' */
--drop trigger trg_board_del;
create or replace trigger trg_board_del
    after
        delete on board /*board에서 데이터가 삭제된 후에 실행*/
        for each row
begin
    update pass_yn 
    set board_write_yn = 'n'
    where member_info_no = (select py.member_info_no 
                            from ir_info ii left join pass_yn py on py.member_info_no = ii.member_info_no 
                            where py.pass_no = :old.pass_no);
end;

create or replace trigger trg_board_insertbos
    after
        insert on board /*board에서 데이터가 삭제된 후에 실행*/
        for each row
begin
    update pass_yn 
    set board_write_yn = 'y'
    where member_info_no = (select py.member_info_no 
                            from ir_info ii left join pass_yn py on py.member_info_no = ii.member_info_no 
                            where py.pass_no = :new.pass_no);
end;
ALTER TABLE board ADD(pass_no number);
COMMENT ON COLUMN  board . pass_no  IS '최종합격 여부';

select * from board left join occupation on board.occupation_code = occupation.occupation_code;

update board set pass_no = 9 where board_no = 68;
commit;
SELECT *
FROM USER_SEQUENCES;

create sequence seq_zoom_no; -- zoom insert 시 적용

delete from zoom where zoom_no in (1,2,3,4)
commit;

select * from zoom left join ir_info on zoom.zoom_no = ir_info.zoom_no left join member on zoom.member_no = member.member_no


;

select
        i.*,
        ie.member_info_no as interviewer_no,
        ie.evaluate_no as evaluate_no,
        nvl(ie.evaluate_value, 0) as evaluate_value,
        nvl(ie.evaluate_comment, '') as evaluate_comment,
        pc.passcheck as passcheck
     from
        assigned_Info ai left join
        interview i on ai.member_info_no = i.imember_info_no
        left join interview_evaluate ie
        on i.interview_NO = ie.interview_NO 
        left join pass_comment pc
        on ie.member_info_no = pc.imember_info_no
--        left join assigned_Info ai on ai.member_info_no = i.imember_info_no
      WHERE ai.member_info_no = '21' 
         and ai.assigned_interviewer = 79;
         
         
         
select ie.*
from assigned_Info ai left join interview i on ai.member_info_no = i.imember_info_no
left join interview_evaluate ie on ie.interview_no = i.interview_no
left join pass_comment pc on ie.member_info_no = pc.imember_info_no and pc.imember_info_no = ai.assigned_interviewer
where ai.member_info_no = 21
and ai.assigned_interviewer = 79;

update zoom set zoom_number = 9836117076, zoom_password = '3hqQXE' where member_no = 121;
commit;

select *
 from zoom
		where member_no = 121
;

select *
from ir_info ii 
        left join zoom z on ii.zoom_no = z.zoom_no
        left join interview_time it on ii.member_info_no = it.member_info_no    
where ii.member_info_no = #{member_info_no}
;
select * from ir_info ii left join member m on ii.member_no = m.member_no 
left join interview_time it on it.member_info_no = ii.member_info_no
where ii.co_code = 2998600021
and sysdate between it.start_time and it.end_time
;
	select 
		*
	from 
		ir_info ii 
	        left join zoom z on ii.zoom_no = z.zoom_no
	        left join interview_time it on ii.member_info_no = it.member_info_no
	where 
		ii.member_info_no = 38
        and sysdate between it.start_time and it.end_time;
        
        
        
-- 프리미엄 관련 시퀀스 추가
-- 연습 질문 시퀀스 추가 적용 필요
SELECT *
FROM USER_SEQUENCES;

create sequence seq_interview_question_no; -- zoom insert 시 적용

ALTER TABLE premium MODIFY (REG_DATE DEFAULT systimestamp);
ALTER TABLE premium MODIFY REG_DATE TIMESTAMP(6);
update premium set reg_date = default 
alter sequence seq_interview_question_no increment by 23;
select seq_interview_question_no.nextval from interview_question where question_no = 1;
alter sequence seq_interview_question_no increment by 1;
delete from premium --where premium_no = 2 
commit;
select * from member
update premium set month = 2 , payment = 9000;

    select m.name, p.month, 
    to_char(((p.reg_date +((INTERVAL '1' month) * p.month))),'YYYY-MM-DD HH24:MI:SS') leftDate
    from member m left join premium p on m.member_no = p.member_no where p.end_yn = 'n' 
    
    and m.member_no = 1
delete from premium where premium_no in (3,4);
commit;

--
select
    m.*, i.member_info_no, e.month, e.end_yn
from
    member m left join ir_info i on m.member_no = i.member_no 
    left join premium e on e.member_no = i.member_no
where
    m.id = 'test201';
select *
from ir_info
where name = '면접자1';
select * from  member_info_no = 21;
select * from zoom;
select * from member
select * from ir_info where co_code = 1208147521