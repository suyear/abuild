
delete from HiMenu where ID = 300000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(300000, 0, 'region', '地区管理', '地区管理', 0, 9999, 0);
--



delete from MenuLink where ID = 300100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(300100, 0, '/regionList.action', '城市列表', '城市列表', 300100, 9999, 300000, 0, 0);
--



delete from HI_Authority where ID = 300100;
--
delete from HI_Authority where ID = 300101;
--
delete from HI_Authority where ID = 300102;
--
delete from HI_Authority where ID = 300103;
--
delete from HI_Authority where ID = 300104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(300100, 0, 'REGION_LIST', 'region.RegionList', '', '城市列表查询', 1, 300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(300101, 0, 'REGION_VIEW', 'region.RegionView', '', '城市列表查看', 2, 300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(300102, 0, 'REGION_SAVE', 'region.RegionSave', '', '城市列表保存', 3, 300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(300103, 0, 'REGION_DEL', 'region.RegionDel', '', '城市列表删除', 4, 300100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(300104, 0, 'REGION_LOOKUP', 'region.RegionLookup', '', '城市列表带回', 1, 300100);
--

delete from HI_PrivilegeResource where ID = 300100;
--
delete from HI_PrivilegeResource where ID = 300101;
--
delete from HI_PrivilegeResource where ID = 300102;
--
delete from HI_PrivilegeResource where ID = 300103;
--
delete from HI_PrivilegeResource where ID = 300104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(300100, 0, 'REGION_LIST', '/regionList.action', 'com.juximao.region.service.RegionManager.getSecurityRegionList', 'REGION_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(300101, 0, 'REGION_VIEW', '/regionView.action', 'com.juximao.region.service.RegionManager.getSecurityRegionById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(300102, 0, 'REGION_SAVE', '/regionSave.action', 'com.juximao.region.service.RegionManager.saveSecurityRegion');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(300103, 0, 'REGION_DEL', '/regionRemove.action', 'com.juximao.region.service.RegionManager.removeSecurityRegionById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(300104, 0, 'REGION_LOOKUP', '/regionLookup.action');
--







--
delete from HI_Language where ID = 300100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(300100, 0, '城市列表', 1, 0);
--
delete from HI_Language where ID = 300101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(300101, 0, '城市名称', 'Region', 1, 0);
--
delete from HI_Language where ID = 300102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(300102, 0, '父城市名称', 'Region', 1, 0);
--
delete from HI_Language where ID = 300103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(300103, 0, '城市排序', 'Region', 1, 0);
--
delete from HI_Language where ID = 300104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(300104, 0, '删除标记', 'Region', 1, 0);
