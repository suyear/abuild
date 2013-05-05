DROP TABLE IF EXISTS Jxm_category;
--
CREATE TABLE Jxm_category (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    parent_id int   NULL,
    cate_name nvarchar (50) NOT NULL,
    cate_img nvarchar (100)  NULL,
    cate_sort int   NULL,
    cate_status nvarchar (2)  NULL,
    share_count int   NULL,
    img_count int   NULL,
    collect_count int   NULL,
    seo_title nvarchar (100)  NULL,
    seo_keyword nvarchar (200)  NULL,
    seo_desc nvarchar (400)  NULL,
    create_user nvarchar (50)  NULL,
    create_date datetime   NULL,
    update_user nvarchar (50)  NULL,
    update_date datetime   NULL,
    is_delete nvarchar (2)  NULL,
    creator int  NULL,
    primary key (id));
--

