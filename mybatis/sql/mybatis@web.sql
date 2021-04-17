--mybatis 시작

--student테이블 생성
create table student(
    no number,
    name varchar2(100) not null,
    tel char(11) not null,
    constraint pk_student_no primary key(no)
);

create sequence seq_student_no;

select * from student order by no desc;
insert into student values(1, '깅지나', '01025003806');
commit;

--mybatis 동적쿼리
--select * from student where no = #{no}
--1. 컬럼명/테이블명 식별자에 대한 동적처리 ${}
--2. 조건식 if, choose
--3. in 조건절 동적처리 where dept_code in ('D5', 'D7') (in 내부 개수 달라짐)

-- web 계정에서 kh 계정의 데이터 접근 처리
select * from kh.employee;
select * from kh.department;
select * from kh.job;
select * from kh.department;

------------------------------------------------------------------
-- kh계정
------------------------------------------------------------------
--접속계정변경
grant all on kh.employee to web;
grant select on kh.department to web;
grant select on kh.job to web;
------------------------------------------------------------------

------------------------------------------------------------------
--web계정
------------------------------------------------------------------
select * from kh.employee;
select * from kh.department;
select * from kh.job;
select * from kh.location;

--동의어 Synonym 생성
--kh employee  emp
--관리자로부터 create synonym 권한 먼저 부여받을 것
create synonym emp for kh.employee;
create synonym dept for kh.department;
create synonym job for kh.job;

------------------------------------------------------------------
-- 관리자계정 system
------------------------------------------------------------------
grant create synonym to web;
------------------------------------------------------------------
desc emp;
select * from emp;
select * from dept;
select * from job;

