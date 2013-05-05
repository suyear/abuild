
delete from HiMenu where ID = 900000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(900000, 0, 'msg', '�ż�����', '�ż�����', 0, 9999, 0);
--



delete from MenuLink where ID = 900100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(900100, 0, '/letterList.action', '�ż��б�', '�ż��б�', 900100, 9999, 900000, 0, 0);
--



delete from HI_Authority where ID = 900100;
--
delete from HI_Authority where ID = 900101;
--
delete from HI_Authority where ID = 900102;
--
delete from HI_Authority where ID = 900103;
--
delete from HI_Authority where ID = 900104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900100, 0, 'LETTER_LIST', 'msg.LetterList', '', '�ż��б��ѯ', 1, 900100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900101, 0, 'LETTER_VIEW', 'msg.LetterView', '', '�ż��б�鿴', 2, 900100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900102, 0, 'LETTER_SAVE', 'msg.LetterSave', '', '�ż��б���', 3, 900100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900103, 0, 'LETTER_DEL', 'msg.LetterDel', '', '�ż��б�ɾ��', 4, 900100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900104, 0, 'LETTER_LOOKUP', 'msg.LetterLookup', '', '�ż��б����', 1, 900100);
--

delete from HI_PrivilegeResource where ID = 900100;
--
delete from HI_PrivilegeResource where ID = 900101;
--
delete from HI_PrivilegeResource where ID = 900102;
--
delete from HI_PrivilegeResource where ID = 900103;
--
delete from HI_PrivilegeResource where ID = 900104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(900100, 0, 'LETTER_LIST', '/letterList.action', 'com.juximao.msg.service.LetterManager.getSecurityLetterList', 'LETTER_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(900101, 0, 'LETTER_VIEW', '/letterView.action', 'com.juximao.msg.service.LetterManager.getSecurityLetterById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(900102, 0, 'LETTER_SAVE', '/letterSave.action', 'com.juximao.msg.service.LetterManager.saveSecurityLetter');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(900103, 0, 'LETTER_DEL', '/letterRemove.action', 'com.juximao.msg.service.LetterManager.removeSecurityLetterById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(900104, 0, 'LETTER_LOOKUP', '/letterLookup.action');
--







--
delete from HI_Language where ID = 900100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(900100, 0, '�ż��б�', 1, 0);
--
delete from HI_Language where ID = 900101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900101, 0, '�ỰID', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900102, 0, '������', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900103, 0, '������', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900104, 0, '�ż�����', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900105, 0, '����ʱ��', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900106, 0, '�Ƿ��ȡ', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900107, 0, '�ż�����', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900108, 0, 'ɾ����������', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900109;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900109, 0, 'ɾ����������', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900110;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900110, 0, '�Ƿ��ȡ', 'Letter', 1, 0);
