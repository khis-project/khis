
select * from user_sequences;

alter table interview rename column name to writer;
alter table ir_info modify co_code null;

select
to_number(to_char(sysdate, 'yymmdd') || to_char(seq_interviewer_no.nextval, 'FM0000')) as interview_no
from dual;

create sequence seq_member_info_no nocache;
drop sequence seq_member_info_no;

create sequence interview_no nocache;
rename interview_no to seq_interview_no;
rename seq_interview_no to seq_interviewer_no;

alter table interview modify member_no null;
alter table interview modify co_code null;
alter table interview modify member_info_no null;

select * from interview;

select * from zoom;

alter table ir_info add ssn varchar2(14);
alter table ir_info add member_ir_haed_no number;

select * from ir_info;
select * from member;

-- 한 명의 면접 관리자가 추가한 
select * from ir_info i join member m
on i.member_no = m.member_no
where role = 'R';

select * from ir_info i join member m
	on i.member_no = m.member_no
	where member_info_no = 15;

insert into member values(
    78, 2118879575, 1234, '김면접관리자', sysdate, 'head1@naver.com', '01012341234', '경기도 평택', 'M', 'IR_HAED', sysdate, 'kimhead', null
);
select * from interview i join ir_info ir
on i.member_info_no = ir.member_info_no
where i.interview_no = 26;

select * from zoom;

select * from ir_info where member_no = 78 and role = 'R';
select * from member where member_no = 78;

select * from ir_info ir inner join assigned_info ai
on ir.member_info_no = ai.member_info_no;

insert into zoom values (
    4, 78, 2118879575, '1234', '1234','1234', '1234'
);

create sequence seq_assigned_info_no nocache;

select *
 from interview i left join ir_info ir
	on i.member_info_no = ir.member_info_no
 	where i.interview_no = 28;
select * from member_company;

select * from ir_info where member_info_no = 51;

select * from interview;

select * from assigned_info;

delete from ir_path;

select * from ir_info where member_info_no = 43;

insert into ir_path values(1, '잡코리아');
insert into ir_path values(2, '사람인');
insert into ir_path values(3, '인크루트');
insert into ir_path values(4, '자회사');
insert into ir_path values(5, '기타');

commit;

select * from ir_path;

select * from ir_info;
select * from interview_time;
create sequence seq_itime_no nocache;

select b.name
    from assigned_info a  left join ir_info b
    on a.member_info_no = b.member_info_no
    where a.assigned_interviewer = 54;
    
delete from assigned_info;

update ir_info set
member_no = null;

commit;
select * from member;


alter table interview_time modify start_time timestamp default systimestamp;
alter table interview_time modify end_time timestamp default systimestamp;

select count(*) from ir_info 
where name = 'asdasd' and email = 'asdasd@asd.zxc' and phone = '1231231234';

alter table interviewer_career modify career_term varchar2(30);

select * from interview i left join ir_info ir
	on i.imember_info_no = ir.member_info_no
 	where i.interview_no = 56;
    
    select *
 from interview i left join ir_info ir
	on i.imember_info_no = ir.member_info_no;
    
select count(*) from (select * from interview where imember_info_no = 42);

create sequence seq_interviewer_info_no nocache;
create sequence seq_interviewer_career_no nocache;
create sequence seq_interviewer_certificate_no nocache;
commit;

insert into interviewer_career values
		(
			seq_interviewer_career_no.nextval,
			2,
			'ㄹㅇㄹㅇ',		
			'ㄹㅇㄹㅇ',		
			to_date('2022-01-01', 'yyyy-mm-dd'),		
			to_date('2022-01-02', 'yyyy-mm-dd')
		),(
			seq_interviewer_career_no.nextval,
			2,
			'ㅁㄴㅁㄴ',		
			'ㅁㄴㅁㄴ',		
			to_date('2022-01-03', 'yyyy-mm-dd'),		
			to_date('2022-01-04', 'yyyy-mm-dd')
		);
        
INSERT ALL    
        into interviewer_career values
            (
			seq_interviewer_career_no.nextval,
			4,
			'1123',		
			'1123',		
			to_date('2022-01-01', 'yyyy-mm-dd'),		
			to_date('2022-01-02', 'yyyy-mm-dd')
		)
         into interviewer_career values
            (
			seq_interviewer_career_no.nextval,
			4,
			'3345',		
			'343534',		
			to_date('2022-01-07', 'yyyy-mm-dd'),		
			to_date('2022-01-08', 'yyyy-mm-dd')
		)
        SELECT * FROM DUAL;
        
        select seq_interviewer_career_no.currval from dual;
        


select * from interviewer_info a left join interviewer_career b
on a.interviewer_info_no = b.interviewer_info_no
left join  interviewer_certificate c
on a.interviewer_info_no = c.interviewer_info_no
where a.interviewer_info_no = 18;

select * from interviewer_info;
select * from interviewer_career where interviewer_info_no = 18;
select * from interviewer_certificate where interviewer_info_no = 18;

select * from assigned_info;

	select b.*
   		from assigned_info a  left join ir_info b
  	  	on a.member_info_no = b.member_info_no
    	where a.assigned_interviewer = 78;
        
        select b.name
   		from assigned_info a  left join ir_info b
  	  	on a.member_info_no = b.member_info_no;
    	where a.assigned_interviewer = 77;
        
select * from assigned_info

select a.*, b.interview_count from ir_info a left outer join (select imember_info_no, count(*) as interview_count from interview
 group by imember_info_no) b
	on a.member_info_no = b.imember_info_no
where interview_count < 3 ;
 
 select imember_info_no, count(*) 
 from interview
 group by imember_info_no ;
 
 select * from interview;
 

 select imember_info_no, count(*) as interview_count from interview
 group by imember_info_no
having count(*) < 3;
 
select a.interview_count, b.* from
 (select imember_info_no, count(*) as interview_count from interview
 group by imember_info_no) a right outer join ir_info b
 on a.imember_info_no = b.member_info_no
 where member_ir_haed_no = 78
 and role = 'I'
 and (interview_count < 3
 or interview_count is null)
 order by b.member_info_no;
 
 select * from ir_info
 where member_ir_haed_no = 78
 and role = 'I'
 order by member_info_no;
 
select * from ir_info where member_info_no = 80;
 select * from interviewer_info;
 
 select * from assigned_info;
 
 select * from company;
 
 select * from member;
 
 insert into zoom values (
 234,
 105,
 2998600021,
 1,
 1,
 1,
 1
 );
 
 select * from interviewer_info;
 
 
 create table chat_member(
    chat_id char(20),
    member_id varchar2(256) not null,
    last_check number default 0,
    status char(1) default 'Y' not null,
    start_date date default sysdate,
    end_date date,
    constraint pk_chat_member_id primary key(chat_id, member_id),
    constraint ck_chat_member_status check(status in ('Y', 'N'))
);

create table chat_log(
    no number, 
    chat_id char(20),
    member_id varchar2(256),
    msg varchar2(2000),
    log_time number, -- message 작성시각 unix time으로 관리
    constraint pk_chat_log_no primary key(no),
    constraint fk_chat_id_member_id foreign key(chat_id, member_id)
                                    references chat_member(chat_id, member_id)
);

create sequence seq_chat_log_no nocache;

select count(*) from 
        (select
	    no,
	    chat_id,
	    (select member_id from chat_member where chat_id = CL.chat_id and member_id != 'admin') member_id,
	    msg,
	    log_time,
	    (select count(*) from chat_log where chat_id = CL.chat_id and log_time > (select last_check from chat_member where chat_id = CL.chat_id and member_id = 'admin')) unread_count
	from (
	    select
	        CL.*,
	        row_number() over(partition by chat_id order by no desc) rnum
	    from
	        chat_log CL) CL
	where
	    rnum = 1);
        
        select a.interview_count, b.* from
	(select imember_info_no, count(*) as interview_count from interview
	group by imember_info_no) a right outer join ir_info b
	on a.imember_info_no = b.member_info_no
	where member_ir_haed_no = #{memberNo}
	and role = 'I'
	and (interview_count < 3 or interview_count is null)
	order by b.member_info_no;
    
    
    insert into
  		chat_log(no, chat_id, member_id, msg, log_time)
  	values(
  		seq_chat_log_no.nextval,
  		'chat_i03G837516y8D48',
  		'kakao11',
  		'zzzzzz',
  		1641894899631
        );
        commit;
        
            insert into
  		chat_log(no, chat_id, member_id, msg, log_time)
  	values(
  		seq_chat_log_no.nextval,
  		'chat_i03G837516y8D48',
  		'kakao11',
  		'테스트중입니다123',
  		1641900096760
        );
        commit;
        
              insert into
  		chat_log(no, chat_id, member_id, msg, log_time)
  	values(
  		seq_chat_log_no.nextval,
  		'chat_i03G837516y8D48',
  		'admin',
  		'테스트중입니다123',
  		1641900096780
        );
        commit;
        
select * from member_company;

select * from member;