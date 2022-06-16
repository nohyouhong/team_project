--회원테이블
create table tbl_member(
    userid varchar2(50) primary key,
    userpw varchar2(50) not null, 
    username varchar2(50) not null,
    email varchar2(100) not null,
    gender varchar2(50) check (gender in('M', 'F')),
    m_regdate date default sysdate,
    m_point number default 0,
    m_picture varchar2(100),
    m_totalattend number default 0,
    m_code number references tbl_member_code(m_code)
);
--회원코드테이블
create table tbl_member_code(
    m_code number primary key,
    m_desc varchar2(100) not null
);

--쪽지테이블
create table tbl_message(
    mno number primary key,
    sender varchar2(50) not null, 
    receiver varchar2(50) not null,
    message varchar2(500) not null,
    senddate date default sysdate,
    opendate date
);
--포인트테이블
create table tbl_point(
    pno number primary key,
    userid varchar2(50) references tbl_member(userid), 
    point number not null,
    p_code number references tbl_point_code(p_code),
    p_regdate date default sysdate
);
--포인트코드테이블
create table tbl_point_code(
    p_code number primary key,
    p_desc varchar2(100) not null
);
--음식종류테이블
create table tbl_foodtype_code(
    f_code number primary key,
    f_type varchar2(50) not null
);
--레시피보드테이블
create table tbl_recipe_board(
    r_bno number primary key,
    r_title varchar2(100) not null, 
    r_content varchar2(4000) not null,
    userid varchar2(50) references tbl_member(userid),
    r_regdate date default sysdate,
    f_code number references tbl_foodtype_code(f_code),
    r_viewcnt number default 0,
    r_likecnt number default 0
);
--레시피보드리뷰테이블
create table tbl_recipe_review(
    r_rno number primary key,
    r_bno number references tbl_recipe_board(r_bno), 
    r_comment varchar2(200) not null,
    userid varchar2(50) references tbl_member(userid),
    r_reviewpic varchar2(300),
    r_regdate date default sysdate,
    re_group number not null,
    re_level number default 0,
    r_code number references tbl_recipe_review_code(r_code)
);
--레시피리뷰코드테이블
create table tbl_recipe_review_code(
    r_code number primary key,
    r_desc number not null
);
--레시피보드댓글테이블
create table tbl_recipe_comment(
    r_cno number primary key,
    r_bno number references tbl_recipe_board(r_bno), 
    r_comment varchar2(200) not null,
    userid varchar2(50) references tbl_member(userid),
    r_regdate date default sysdate
);
--레시피보드글테이블
create table tbl_recipe_content(
    r_cno number primary key,
    r_bno number references tbl_recipe_board(r_bno), 
    r_content varchar2(4000) not null
);
--레시피보드사진테이블
create table tbl_recipe_pic(
    r_pno number primary key,
    r_cno number references tbl_recipe_content(r_cno), 
    r_picture varchar2(300)
);
--레시피보드사진테이블
create table tbl_recipe_tag(
    r_tno number primary key,
    r_bno number references tbl_recipe_board(r_bno), 
    r_tag varchar2(100) not null
);
--전체문의글보드테이블
a
--문의글보드테이블
create table tbl_ask_board(
    a_bno number primary key,
    a_title varchar2(100) not null, 
    a_content varchar2(4000) not null,
    a_sender varchar2(50) references tbl_member(userid),
    a_receiver varchar2(50) references tbl_member(userid),
    a_regdate date default sysdate
);
--문의글사진보드
create table tbl_ask_board_pic(
    a_picture varchar2(300) primary key,
    a_bno number references tbl_ask_board(a_bno) on delete cascade
);
--공지사항보드테이블
create table tbl_notice_board(
    n_bno number primary key,
    n_title varchar2(100) not null,
    n_content varchar2(4000) not null,
    userid varchar2(50) references tbl_member(userid),
    n_regdate date default sysdate
);
--칼럼보드테이블
create table tbl_column_board(
    c_bno number primary key,
    c_title varchar2(100) not null, 
    c_content varchar2(4000) not null,
    userid varchar2(50) references tbl_member(userid),
    c_regdate date default sysdate,
    c_viewcnt number default 0,
    c_likecnt number default 0
);
--칼럼보드사진테이블
create table tbl_column_pic(
    c_pno number primary key,
    c_bno number references tbl_column_board(c_bno), 
    c_picture varchar2(300)
);
--칼럼보드좋아요테이블
create table tbl_column_like(
    c_lno number primary key,
    c_bno number references tbl_column_board(c_bno), 
    userid varchar2(50) references tbl_member(userid)
);
--쇼핑몽보드테이블
create table tbl_pointshop_board(
    p_bno number primary key,
    p_title varchar2(100) not null, 
    p_content varchar2(4000) not null,
    userid varchar2(50) references tbl_member(userid),
    p_regdate date default sysdate,
    p_viewcnt number default 0
);
--상품테이블
create table tbl_product(
    pno number primary key,
    p_name varchar2(50) not null, 
    p_price number not null,
    p_stock number default 0
);
--상품사진테이블
create table tbl_product_pic(
    p_picture number primary key,
    p_bno number references tbl_pointshop_board(p_bno)
);
--주문리스트테이블
create table tbl_order_list(
    o_lno number primary key,
    userid varchar2(50) references tbl_member(userid),
    o_regdate date default sysdate
);
--주문상세테이블 - 빈 명세서
create table tbl_order_detail(
    o_dno number primary key,
    pno number references tbl_product(pno),
    o_lno number references tbl_order_list(o_lno),
    o_amount number not null,
    o_sum number not null
);
--후기테이블 - 명세서에 물품하나하나
create table tbl_pointshop_comment(
    p_cno number primary key,
    p_bno number references tbl_pointshop_board(p_bno),
    userid varchar2(50) references tbl_member(userid),
    p_comment varchar2(300) not null,
    p_grade number default 5
);
--출석테이블
create table tbl_attendance(
    ano number primary key,
    userid varchar2(50) references tbl_member(userid), 
    a_regdate date default sysdate
);
--재료테이블(애는 나눌시 안나눌시 위에 합친거잇음)
create table tbl_ingredient(
    i_name varchar2(50) primary key,
    i_unit varchar2(5) not null,
    i_address varchar2(300)
);
--재료리스트이블
create table tbl_ingredient_list(
    lno number primary key,
    r_bno number references tbl_recipe_board(r_bno), 
    i_name varchar2(50) references tbl_ingredient(i_name),
    i_amount number default 0
);