
delete from HiMenu where ID = 600000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(600000, 0, 'image', '图片管理', '图片管理', 0, 9999, 0);
--



delete from MenuLink where ID = 600100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(600100, 0, '/imageList.action', '图片列表', '图片列表', 600100, 9999, 600000, 0, 0);
--



delete from HI_Authority where ID = 600100;
--
delete from HI_Authority where ID = 600101;
--
delete from HI_Authority where ID = 600102;
--
delete from HI_Authority where ID = 600103;
--
delete from HI_Authority where ID = 600104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(600100, 0, 'IMAGE_LIST', 'image.ImageList', '', '图片列表查询', 1, 600100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(600101, 0, 'IMAGE_VIEW', 'image.ImageView', '', '图片列表查看', 2, 600100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(600102, 0, 'IMAGE_SAVE', 'image.ImageSave', '', '图片列表保存', 3, 600100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(600103, 0, 'IMAGE_DEL', 'image.ImageDel', '', '图片列表删除', 4, 600100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(600104, 0, 'IMAGE_LOOKUP', 'image.ImageLookup', '', '图片列表带回', 1, 600100);
--

delete from HI_PrivilegeResource where ID = 600100;
--
delete from HI_PrivilegeResource where ID = 600101;
--
delete from HI_PrivilegeResource where ID = 600102;
--
delete from HI_PrivilegeResource where ID = 600103;
--
delete from HI_PrivilegeResource where ID = 600104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(600100, 0, 'IMAGE_LIST', '/imageList.action', 'com.juximao.image.service.ImageManager.getSecurityImageList', 'IMAGE_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(600101, 0, 'IMAGE_VIEW', '/imageView.action', 'com.juximao.image.service.ImageManager.getSecurityImageById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(600102, 0, 'IMAGE_SAVE', '/imageSave.action', 'com.juximao.image.service.ImageManager.saveSecurityImage');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(600103, 0, 'IMAGE_DEL', '/imageRemove.action', 'com.juximao.image.service.ImageManager.removeSecurityImageById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(600104, 0, 'IMAGE_LOOKUP', '/imageLookup.action');
--







--
delete from HI_Language where ID = 600100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(600100, 0, '图片列表', 1, 0);
--
delete from HI_Language where ID = 600101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(600101, 0, '图片地址', 'Image', 1, 0);
--
delete from HI_Language where ID = 600102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(600102, 0, '图片名称', 'Image', 1, 0);
--
delete from HI_Language where ID = 600103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(600103, 0, '图片宽度', 'Image', 1, 0);
--
delete from HI_Language where ID = 600104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(600104, 0, '图片高度', 'Image', 1, 0);
--
delete from HI_Language where ID = 600105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(600105, 0, '图片比例，高除以宽', 'Image', 1, 0);
