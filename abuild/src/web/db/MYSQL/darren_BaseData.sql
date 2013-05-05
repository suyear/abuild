
delete from HiMenu where ID = 500000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(500000, 0, 'darren', '���˹���', '���˹���', 0, 9999, 0);
--



delete from MenuLink where ID = 500100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(500100, 0, '/darrenList.action', '�����б�', '�����б�', 500100, 9999, 500000, 0, 0);
--



delete from HI_Authority where ID = 500100;
--
delete from HI_Authority where ID = 500101;
--
delete from HI_Authority where ID = 500102;
--
delete from HI_Authority where ID = 500103;
--
delete from HI_Authority where ID = 500104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(500100, 0, 'DARREN_LIST', 'darren.DarrenList', '', '�����б��ѯ', 1, 500100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(500101, 0, 'DARREN_VIEW', 'darren.DarrenView', '', '�����б�鿴', 2, 500100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(500102, 0, 'DARREN_SAVE', 'darren.DarrenSave', '', '�����б���', 3, 500100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(500103, 0, 'DARREN_DEL', 'darren.DarrenDel', '', '�����б�ɾ��', 4, 500100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(500104, 0, 'DARREN_LOOKUP', 'darren.DarrenLookup', '', '�����б����', 1, 500100);
--

delete from HI_PrivilegeResource where ID = 500100;
--
delete from HI_PrivilegeResource where ID = 500101;
--
delete from HI_PrivilegeResource where ID = 500102;
--
delete from HI_PrivilegeResource where ID = 500103;
--
delete from HI_PrivilegeResource where ID = 500104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(500100, 0, 'DARREN_LIST', '/darrenList.action', 'com.juximao.darren.service.DarrenManager.getSecurityDarrenList', 'DARREN_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(500101, 0, 'DARREN_VIEW', '/darrenView.action', 'com.juximao.darren.service.DarrenManager.getSecurityDarrenById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(500102, 0, 'DARREN_SAVE', '/darrenSave.action', 'com.juximao.darren.service.DarrenManager.saveSecurityDarren');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(500103, 0, 'DARREN_DEL', '/darrenRemove.action', 'com.juximao.darren.service.DarrenManager.removeSecurityDarrenById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(500104, 0, 'DARREN_LOOKUP', '/darrenLookup.action');
--







--
delete from HI_Language where ID = 500100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(500100, 0, '�����б�', 1, 0);
--
delete from HI_Language where ID = 500101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(500101, 0, '�û���', 'Darren', 1, 0);
--
delete from HI_Language where ID = 500102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(500102, 0, '���', 'Darren', 1, 0);
--
delete from HI_Language where ID = 500103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(500103, 0, '��ҳͼƬ', 'Darren', 1, 0);
--
delete from HI_Language where ID = 500104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(500104, 0, '�Ƿ�Ϊ��ҳ', 'Darren', 1, 0);
--
delete from HI_Language where ID = 500105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(500105, 0, '�Ƿ�Ϊ�Ƽ�', 'Darren', 1, 0);
--
delete from HI_Language where ID = 500106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(500106, 0, 'ɾ�����', 'Darren', 1, 0);
