DROP TABLE IF EXISTS Jxm_mobile;
--
CREATE TABLE Jxm_mobile (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    member_id int   NULL,
    name nvarchar (30)  NULL,
    code nvarchar (30)  NULL,
    phone nvarchar (30)  NULL,
    check_code nvarchar (30)  NULL,
    is_check int   NULL,
    send_date datetime   NULL,
    ip_addr nvarchar (30)  NULL,
    creator int  NULL,
    primary key (id));
--

