DROP TABLE IF EXISTS Jxm_darren;
--
CREATE TABLE Jxm_darren (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    member_id int   NULL,
    member_name nvarchar (50) NOT NULL,
    darrenphoto nvarchar (30)  NULL,
    darren_intro nvarchar (400)  NULL,
    index_img nvarchar (100)  NULL,
    is_index nvarchar (2)  NULL,
    is_commend nvarchar (2)  NULL,
    create_user nvarchar (50)  NULL,
    create_date datetime   NULL,
    update_user nvarchar (50)  NULL,
    update_date datetime   NULL,
    is_delete nvarchar (2)  NULL,
    creator int  NULL,
    primary key (id));
--

