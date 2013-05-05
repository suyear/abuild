
delete from HiMenu where ID = 100000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(100000, 0, 'share', '分享管理', '分享管理', 0, 9999, 0);
--



delete from MenuLink where ID = 100300;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(100300, 0, '/tagsShareList.action', '标签分享', '标签分享', 100300, 9999, 100000, 0, 0);
--



delete from HI_Authority where ID = 100300;
--
delete from HI_Authority where ID = 100301;
--
delete from HI_Authority where ID = 100302;
--
delete from HI_Authority where ID = 100303;
--
delete from HI_Authority where ID = 100304;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(100300, 0, 'TAGSSHARE_LIST', 'share.TagsShareList', '', '标签分享查询', 1, 100300);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(100301, 0, 'TAGSSHARE_VIEW', 'share.TagsShareView', '', '标签分享查看', 2, 100300);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(100302, 0, 'TAGSSHARE_SAVE', 'share.TagsShareSave', '', '标签分享保存', 3, 100300);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(100303, 0, 'TAGSSHARE_DEL', 'share.TagsShareDel', '', '标签分享删除', 4, 100300);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(100304, 0, 'TAGSSHARE_LOOKUP', 'share.TagsShareLookup', '', '标签分享带回', 1, 100300);
--

delete from HI_PrivilegeResource where ID = 100300;
--
delete from HI_PrivilegeResource where ID = 100301;
--
delete from HI_PrivilegeResource where ID = 100302;
--
delete from HI_PrivilegeResource where ID = 100303;
--
delete from HI_PrivilegeResource where ID = 100304;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(100300, 0, 'TAGSSHARE_LIST', '/tagsShareList.action', 'com.juximao.share.service.TagsShareManager.getSecurityTagsShareList', 'TAGSSHARE_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(100301, 0, 'TAGSSHARE_VIEW', '/tagsShareView.action', 'com.juximao.share.service.TagsShareManager.getSecurityTagsShareById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(100302, 0, 'TAGSSHARE_SAVE', '/tagsShareSave.action', 'com.juximao.share.service.TagsShareManager.saveSecurityTagsShare');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(100303, 0, 'TAGSSHARE_DEL', '/tagsShareRemove.action', 'com.juximao.share.service.TagsShareManager.removeSecurityTagsShareById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(100304, 0, 'TAGSSHARE_LOOKUP', '/tagsShareLookup.action');
--







--
delete from HI_Language where ID = 100300;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(100300, 0, '标签分享', 1, 0);
--
delete from HI_Language where ID = 100301;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(100301, 0, '标签ID', 'TagsShare', 1, 0);
--
delete from HI_Language where ID = 100302;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(100302, 0, '分享ID', 'TagsShare', 1, 0);
