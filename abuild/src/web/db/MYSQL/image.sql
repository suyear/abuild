DROP TABLE IF EXISTS Jxm_image;
--
CREATE TABLE Jxm_image (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    share_id int   NULL,
    img_url nvarchar (200)  NULL,
    img_name nvarchar (100)  NULL,
    img_width int   NULL,
    img_height int   NULL,
    img_scale decimal (3,2)  NULL,
    create_user nvarchar (50)  NULL,
    create_date datetime   NULL,
    update_user nvarchar (50)  NULL,
    update_date datetime   NULL,
    creator int  NULL,
    primary key (id));
--

