DROP TABLE IF EXISTS Jxm_letter;
--
CREATE TABLE Jxm_letter (
    id int auto_increment NOT NULL ,
    version int NOT NULL ,
    session_id int   NULL,
    s_mid int   NULL,
    r_mid int   NULL,
    s_memberName nvarchar (50)  NULL,
    r_memberName nvarchar (50)  NULL,
    context nvarchar (400)  NULL,
    send_time datetime   NULL,
    is_read nvarchar (2)  NULL,
    msg_type nvarchar (2)  NULL,
    is_delete_send nvarchar (2)  NULL,
    is_delete_receive nvarchar (2)  NULL,
    is_reply nvarchar (2)  NULL,
    creator int  NULL,
    primary key (id));
--

