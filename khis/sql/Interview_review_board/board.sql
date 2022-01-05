-- 컬럼명 수정
alter table board rename column recluitment_method to recruitment_method;
alter table board rename column rank to interview_evaluation; -- (rank -> interview_evaluation)

-- reg_date default값 설정
alter table board modify (reg_date default to_char(sysdate,'YYYY-MM-DD'));

-- 컬럼 삭제
alter table board drop column interview_experience;

-- 컬럼 추가
alter table board add INTERVIEW_ANSWER varchar2(2000);
alter table board add interview_question varchar2(2000);

-- 테이블 삭제
drop table board_question;
drop table board_company_question;

-- 컬럼 데이터 사이즈 변경
alter table board modify recruitment_method varchar2(100);

-- 시퀀스 생성
create sequence seq_board_no;
create sequence seq_company_score_no;

-- occupation 테이블 데이터 insert
insert into occupation values(1, '서비스업');
insert into occupation values(2, '제조/화학');
insert into occupation values(3, '의료/제약/복지');
insert into occupation values(4, '유통/무역/운송');
insert into occupation values(5, '교육업');
insert into occupation values(6, '건설업');
insert into occupation values(7, 'IT/웹/통신');
insert into occupation values(8, '미디어/디자인');
insert into occupation values(9, '은행/금융업');
insert into occupation values(10, '기관/협회');

-- 조회
select * from board order by board_no desc;
select * from occupation;
