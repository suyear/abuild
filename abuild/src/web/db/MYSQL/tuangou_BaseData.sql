
delete from HiMenu where ID = 1100000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(1100000, 0, 'tuangou', '�Ź�����', '�Ź�����', 0, 9999, 0);
--



delete from MenuLink where ID = 1100100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(1100100, 0, '/tuangouList.action', '�Ź�����', '�Ź�����', 1100100, 9999, 1100000, 0, 0);
--



delete from HI_Authority where ID = 1100100;
--
delete from HI_Authority where ID = 1100101;
--
delete from HI_Authority where ID = 1100102;
--
delete from HI_Authority where ID = 1100103;
--
delete from HI_Authority where ID = 1100104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1100100, 0, 'TUANGOU_LIST', 'tuangou.TuangouList', '', '�Ź������ѯ', 1, 1100100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1100101, 0, 'TUANGOU_VIEW', 'tuangou.TuangouView', '', '�Ź�����鿴', 2, 1100100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1100102, 0, 'TUANGOU_SAVE', 'tuangou.TuangouSave', '', '�Ź�������', 3, 1100100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1100103, 0, 'TUANGOU_DEL', 'tuangou.TuangouDel', '', '�Ź�����ɾ��', 4, 1100100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1100104, 0, 'TUANGOU_LOOKUP', 'tuangou.TuangouLookup', '', '�Ź��������', 1, 1100100);
--

delete from HI_PrivilegeResource where ID = 1100100;
--
delete from HI_PrivilegeResource where ID = 1100101;
--
delete from HI_PrivilegeResource where ID = 1100102;
--
delete from HI_PrivilegeResource where ID = 1100103;
--
delete from HI_PrivilegeResource where ID = 1100104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(1100100, 0, 'TUANGOU_LIST', '/tuangouList.action', 'com.juximao.tuangou.service.TuangouManager.getSecurityTuangouList', 'TUANGOU_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1100101, 0, 'TUANGOU_VIEW', '/tuangouView.action', 'com.juximao.tuangou.service.TuangouManager.getSecurityTuangouById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1100102, 0, 'TUANGOU_SAVE', '/tuangouSave.action', 'com.juximao.tuangou.service.TuangouManager.saveSecurityTuangou');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1100103, 0, 'TUANGOU_DEL', '/tuangouRemove.action', 'com.juximao.tuangou.service.TuangouManager.removeSecurityTuangouById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(1100104, 0, 'TUANGOU_LOOKUP', '/tuangouLookup.action');
--







--
delete from HI_Language where ID = 1100100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(1100100, 0, '�Ź�����', 1, 0);
--
delete from HI_Language where ID = 1100101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100101, 0, '����', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100102, 0, '�ؼ�', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100103, 0, 'ԭ��', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100104, 0, '�ۿ�', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100105, 0, '����ʱ��', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100106, 0, '������', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100107, 0, '�Ź�����', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100108, 0, '��ܰ��ʾ', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100109;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100109, 0, '�������', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100110;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100110, 0, '�Ƿ�����', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100111;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100111, 0, '�Ƿ��Ƽ�', 'Tuangou', 1, 0);
--
delete from HI_Language where ID = 1100112;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1100112, 0, '����ʱ��', 'Tuangou', 1, 0);
