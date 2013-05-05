DROP TABLE IF EXISTS Jxm_region;
--
CREATE TABLE Jxm_region (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    city_name nvarchar (50) NOT NULL,
    parent_id int  NULL,
    sort int   NULL,
    create_user nvarchar (50)  NULL,
    create_date datetime   NULL,
    update_user nvarchar (50)  NULL,
    update_date datetime   NULL,
    is_delete nvarchar (2)  NULL,
    creator int  NULL,
    primary key (id));
--

