DROP TABLE IF EXISTS Jxm_orders;
--
CREATE TABLE Jxm_orders (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    member_id int   NULL,
    province_id int   NULL,
    city_id int   NULL,
    share_id int   NULL,
    indent_type nvarchar (2)  NULL,
    indent_user nvarchar (50)  NULL,
    price nvarchar (30)  NULL,
    deposit nvarchar (30)  NULL,
    qq_number nvarchar (30)  NULL,
    phone nvarchar (30)  NULL,
    addr nvarchar (30)  NULL,
    email nvarchar (100)  NULL,
    ip_addr nvarchar (30)  NULL,
    create_date datetime   NULL,
    update_date datetime   NULL,
    pay_status nvarchar (2)  NULL,
    pay_method nvarchar (2)  NULL,
    status nvarchar (30)  NULL,
    is_delete nvarchar (2)  NULL,
    primary key (id));
--

