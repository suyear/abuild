
delete from HiMenu where ID = 900000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(900000, 0, 'msg', '信件管理', '信件管理', 0, 9999, 0);
--



delete from MenuLink where ID = 900100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(900100, 0, '/letterList.action', '信件列表', '信件列表', 900100, 9999, 900000, 0, 0);
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
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900100, 0, 'LETTER_LIST', 'msg.LetterList', '', '信件列表查询', 1, 900100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900101, 0, 'LETTER_VIEW', 'msg.LetterView', '', '信件列表查看', 2, 900100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900102, 0, 'LETTER_SAVE', 'msg.LetterSave', '', '信件列表保存', 3, 900100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900103, 0, 'LETTER_DEL', 'msg.LetterDel', '', '信件列表删除', 4, 900100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(900104, 0, 'LETTER_LOOKUP', 'msg.LetterLookup', '', '信件列表带回', 1, 900100);
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
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(900100, 0, '信件列表', 1, 0);
--
delete from HI_Language where ID = 900101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900101, 0, '会话ID', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900102, 0, '发信人', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900103, 0, '收信人', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900104, 0, '信件内容', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900105, 0, '发信时间', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900106, 0, '是否读取', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900107, 0, '信件类型', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900108, 0, '删除发信内容', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900109;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900109, 0, '删除收信内容', 'Letter', 1, 0);
--
delete from HI_Language where ID = 900110;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(900110, 0, '是否读取', 'Letter', 1, 0);
