DROP TABLE IF EXISTS Jxm_tuangou;
--
CREATE TABLE Jxm_tuangou (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    title nvarchar (30)  NULL,
    price decimal (18,2)  NULL,
    old_price decimal (18,2)  NULL,
    off decimal (18,2)  NULL,
    end_time datetime   NULL,
    intro nvarchar (500)  NULL,
    context nvarchar (500)  NULL,
    tips nvarchar (30)  NULL,
    buy_count int   NULL,
    is_hot int   NULL,
    is_commend int   NULL,
    create_date datetime   NULL,
    primary key (id));
--

