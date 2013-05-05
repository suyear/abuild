DROP TABLE IF EXISTS Jxm_comment;
--
CREATE TABLE Jxm_comment (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    share_id int   NULL,
    member_id int   NULL,
    member_name nvarchar (30)  NULL,
    reply_id int   NULL,
    comment_context nvarchar (400)  NULL,
    create_user nvarchar (50)  NULL,
    create_date datetime   NULL,
    update_user nvarchar (50)  NULL,
    update_date datetime   NULL,
    is_delete nvarchar (2)  NULL,
    creator int  NULL,
    primary key (id));
--

