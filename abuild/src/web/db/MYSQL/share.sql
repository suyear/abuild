DROP TABLE IF EXISTS Jxm_share_tags;
--
CREATE TABLE Jxm_share_tags (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    tags_id int   NULL,
    share_id int   NULL,
    creator int  NULL,
    primary key (id));
--

