DROP TABLE IF EXISTS Jxm_goods;
--
CREATE TABLE Jxm_goods (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    title nvarchar (30)  NULL,
    intro nvarchar (500)  NULL,
    feature nvarchar (500)  NULL,
    option nvarchar (500)  NULL,
    price decimal (18,2)  NULL,
    create_date datetime   NULL,
    buy_count int   NULL,
    is_hot int   NULL,
    is_commend int   NULL,
    creator int  NULL,
    primary key (id));
--

