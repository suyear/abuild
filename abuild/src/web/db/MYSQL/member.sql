DROP TABLE IF EXISTS Jxm_member;
--
CREATE TABLE Jxm_member (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    group_id int  NULL,
    province_id int   NULL,
    city_id int  NULL,
    email nvarchar (30) NOT NULL,
    member_name nvarchar (50) NOT NULL,
    password nvarchar (50) NOT NULL,
    sex nvarchar (2)  NULL,
    head_img nvarchar (300)  NULL,
    credits int   NULL,
    memberGroup_name nvarchar (30)  NULL,
    create_user nvarchar (50)  NULL,
    create_date datetime   NULL,
    update_user nvarchar (50)  NULL,
    update_date datetime   NULL,
    fans_count int   NULL,
    atten_count int   NULL,
    ucenter_id int   NULL,
    is_delete nvarchar (2)  NULL,
    share_count int   NULL,
    introduce nvarchar (200)  NULL,
    creator int  NULL,
    primary key (id));
--

