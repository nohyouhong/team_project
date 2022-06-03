--ȸ�����̺�
create table tbl_member(
    userid varchar2(50) primary key,
    userpw varchar2(50) not null, 
    username varchar2(50) not null,
    email varchar2(100) not null,
    gender varchar2(50) check (gender in('M', 'F')),
    m_regdate date default sysdate,
    m_point number default 0,
    m_picture varchar2(100)
);
--�������̺�
create table tbl_message(
    mno number primary key,
    sender varchar2(50) not null, 
    receiver varchar2(50) not null,
    message varchar2(500) not null,
    senddate date default sysdate,
    opendate date
);
--����Ʈ���̺�
create table tbl_point(
    pno number primary key,
    userid varchar2(50) references tbl_member(userid), 
    point number not null,
    p_code number references tbl_point_code(p_code),
    p_regdate date default sysdate
);
--����Ʈ�ڵ����̺�
create table tbl_point_code(
    p_code number primary key,
    p_desc varchar2(100) not null
);
--�����������̺�
create table tbl_foodtype_code(
    f_code number primary key,
    f_type varchar2(50) not null
);
--�����Ǻ������̺�
create table tbl_recipe_board(
    r_bno number primary key,
    r_title varchar2(100) not null, 
    r_content varchar2(4000) not null,
    userid varchar2(50) references tbl_member(userid),
    r_regdate date default sysdate,
    f_code number references tbl_foodtype_code(f_code),
    r_viewcnt number default 0
);
--�����Ǻ��������̺�
create table tbl_recipe_comment(
    r_cno number primary key,
    r_bno varchar2(100) references tbl_recipe_board(r_bno), 
    r_comment varchar2(200) not null,
    userid varchar2(50) references tbl_member(userid),
    r_regdate date default sysdate
);
--�����Ǻ���������̺�
create table tbl_recipe_pic(
    r_pno number primary key,
    r_bno varchar2(100) references tbl_recipe_board(r_bno), 
    r_picture varchar2(300)
);
--�����Ǻ������ƿ����̺�
create table tbl_recipe_like(
    r_lno number primary key,
    r_bno varchar2(100) references tbl_recipe_board(r_bno), 
    userid varchar2(50) references tbl_member(userid)
);

--���Ǳۺ������̺�
create table tbl_ask_board(
    a_bno number primary key,
    a_title varchar2(100) not null, 
    a_content varchar2(4000) not null,
    userid varchar2(50) references tbl_member(userid),
    a_regdate date default sysdate,
    a_viewcnt number default 0,
    re_group number  default 0,
    re_level number  default 0,
    re_seq number  default 0
);
--Į���������̺�
create table tbl_column_board(
    c_bno number primary key,
    c_title varchar2(100) not null, 
    c_content varchar2(4000) not null,
    userid varchar2(50) references tbl_member(userid),
    c_regdate date default sysdate,
    c_viewcnt number default 0
);
--���θ��������̺�
create table tbl_pointshop_board(
    p_bno number primary key,
    p_title varchar2(100) not null, 
    p_content varchar2(4000) not null,
    userid varchar2(50) references tbl_member(userid),
    p_regdate date default sysdate,
    p_viewcnt number default 0
);
--��ǰ���̺�
create table tbl_product(
    pno number primary key,
    p_name varchar2(50) not null, 
    p_price number not null,
    p_stock number default 0
);
--��ǰ�������̺�
create table tbl_product_pic(
    p_picture number primary key,
    p_bno number references tbl_pointshop_board(p_bno)
);
--�ֹ�����Ʈ���̺�
create table tbl_order_list(
    o_lno number primary key,
    userid varchar2(50) references tbl_member(userid)
    o_regdate date default sysdate
);
--�ֹ������̺� - �� ����
create table tbl_order_detail(
    o_dno number primary key,
    pno number references tbl_product(pno),
    o_lno number references tbl_order_list(o_lno),
    o_amount number not null,
    o_sum number not null
);
--�ı����̺� - ������ ��ǰ�ϳ��ϳ�
create table tbl_pointshop_comment(
    p_cno number primary key,
    p_bno number references tbl_pointshop_board(p_bno),
    userid varchar2(50) references tbl_member(userid),
    p_comment varchar2(300) not null,
    p_grade number default 5
);
--�⼮���̺�
create table tbl_attendance(
    ano number primary key,
    userid varchar2(50) references tbl_member(userid), 
    a_regdate date default sysdate
);
--������̺�(�ִ� ������ �ȳ����� ���� ��ģ������)
create table tbl_ingredient(
    i_name varchar2(50) primary key,
    i_unit varchar2(5) not null,
    i_address varchar2(300)
);
--��Ḯ��Ʈ�̺�
create table tbl_ingredient_list(
    lno number primary key,
    r_bno varchar2(100) references tbl_recipe_board(r_bno), 
    i_name varchar2(50) references tbl_ingredient(i_name),
    i_amount number default 0
);
