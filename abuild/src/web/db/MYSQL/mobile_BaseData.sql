
delete from HiMenu where ID = 1300000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(1300000, 0, 'mobile', '������֤����', '������֤����', 0, 9999, 0);
--



delete from MenuLink where ID = 1300100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(1300100, 0, '/mobileList.action', '������֤����', '������֤����', 1300100, 9999, 1300000, 0, 0);
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
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300100, 0, 'MOBILE_LIST', 'mobile.MobileList', '', '������֤�����ѯ', 1, 1300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300101, 0, 'MOBILE_VIEW', 'mobile.MobileView', '', '������֤����鿴', 2, 1300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300102, 0, 'MOBILE_SAVE', 'mobile.MobileSave', '', '������֤������', 3, 1300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300103, 0, 'MOBILE_DEL', 'mobile.MobileDel', '', '������֤����ɾ��', 4, 1300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1300104, 0, 'MOBILE_LOOKUP', 'mobile.MobileLookup', '', '������֤�������', 1, 1300100);
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
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(1300100, 0, '������֤����', 1, 0);
--
delete from HI_Language where ID = 1300101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300101, 0, '�û�ID', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300102, 0, '����', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300103, 0, '����', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300104, 0, '�ֻ�����', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300105, 0, '��֤��', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300106, 0, '�Ƿ���֤', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300107, 0, '����ʱ��', 'Mobile', 1, 0);
--
delete from HI_Language where ID = 1300108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1300108, 0, 'ip��ַ', 'Mobile', 1, 0);
