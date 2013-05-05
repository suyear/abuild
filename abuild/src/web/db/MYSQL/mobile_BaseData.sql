
delete from HiMenu where ID = 1300000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(1300000, 0, 'mobile', '短信验证管理', '短信验证管理', 0, 9999, 0);
--



delete from MenuLink where ID = 1300100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(1300100, 0, '/mobileList.action', '短信验证管理', '短信验证管理', 1300100, 9999, 1300000, 0, 0);
--



delete from HI_Authority where ID = 1300100;
--
delete from HI_Authority where ID = 1300101;
--
delete from HI_Authority where ID = 1300102;
--
delete from HI_Authority where ID = 1300103;
--
delete from HI_Authority where ID = 1300104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300100, 0, 'MOBILE_LIST', 'mobile.MobileList', '', '短信验证管理查询', 1, 1300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300101, 0, 'MOBILE_VIEW', 'mobile.MobileView', '', '短信验证管理查看', 2, 1300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300102, 0, 'MOBILE_SAVE', 'mobile.MobileSave', '', '短信验证管理保存', 3, 1300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300103, 0, 'MOBILE_DEL', 'mobile.MobileDel', '', '短信验证管理删除', 4, 1300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300104, 0, 'MOBILE_LOOKUP', 'mobile.MobileLookup', '', '短信验证管理带回', 1, 1300100);
--

delete from HI_PrivilegeResource where ID = 1300100;
--
delete from HI_PrivilegeResource where ID = 1300101;
--
delete from HI_PrivilegeResource where ID = 1300102;
--
delete from HI_PrivilegeResource where ID = 1300103;
--
delete from HI_PrivilegeResource where ID = 1300104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(1300100, 0, 'MOBILE_LIST', '/mobileList.action', 'com.juximao.mobile.service.MobileManager.getSecurityMobileList', 'MOBILE_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1300101, 0, 'MOBILE_VIEW', '/mobileView.action', 'com.juximao.mobile.service.MobileManager.getSecurityMobileById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1300102, 0, 'MOBILE_SAVE', '/mobileSave.action', 'com.juximao.mobile.service.MobileManager.saveSecurityMobile');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1300103, 0, 'MOBILE_DEL', '/mobileRemove.action', 'com.juximao.mobile.service.MobileManager.removeSecurityMobileById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(1300104, 0, 'MOBILE_LOOKUP', '/mobileLookup.action');
--







--
delete from HI_Language where ID = 1300100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(1300100, 0, '短信验证管理', 1, 0);
--
delete from HI_Language where ID = 1300101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300101, 0, '用户ID', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300102, 0, '姓名', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300103, 0, '描述', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300104, 0, '手机号码', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300105, 0, '验证码', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300106, 0, '是否验证', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300107, 0, '发送时间', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300108, 0, 'ip地址', 'Mobile', 1, 0);
