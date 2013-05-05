
delete from HiMenu where ID = 200000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(200000, 0, 'category', '分类管理', '分类管理', 0, 9999, 0);
--



delete from MenuLink where ID = 200100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(200100, 0, '/categoryList.action', '分类列表', '分类列表', 200100, 9999, 200000, 0, 0);
--



delete from HI_Authority where ID = 200100;
--
delete from HI_Authority where ID = 200101;
--
delete from HI_Authority where ID = 200102;
--
delete from HI_Authority where ID = 200103;
--
delete from HI_Authority where ID = 200104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(200100, 0, 'CATEGORY_LIST', 'category.CategoryList', '', '分类列表查询', 1, 200100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(200101, 0, 'CATEGORY_VIEW', 'category.CategoryView', '', '分类列表查看', 2, 200100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(200102, 0, 'CATEGORY_SAVE', 'category.CategorySave', '', '分类列表保存', 3, 200100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(200103, 0, 'CATEGORY_DEL', 'category.CategoryDel', '', '分类列表删除', 4, 200100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(200104, 0, 'CATEGORY_LOOKUP', 'category.CategoryLookup', '', '分类列表带回', 1, 200100);
--

delete from HI_PrivilegeResource where ID = 200100;
--
delete from HI_PrivilegeResource where ID = 200101;
--
delete from HI_PrivilegeResource where ID = 200102;
--
delete from HI_PrivilegeResource where ID = 200103;
--
delete from HI_PrivilegeResource where ID = 200104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(200100, 0, 'CATEGORY_LIST', '/categoryList.action', 'com.juximao.category.service.CategoryManager.getSecurityCategoryList', 'CATEGORY_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(200101, 0, 'CATEGORY_VIEW', '/categoryView.action', 'com.juximao.category.service.CategoryManager.getSecurityCategoryById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(200102, 0, 'CATEGORY_SAVE', '/categorySave.action', 'com.juximao.category.service.CategoryManager.saveSecurityCategory');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(200103, 0, 'CATEGORY_DEL', '/categoryRemove.action', 'com.juximao.category.service.CategoryManager.removeSecurityCategoryById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(200104, 0, 'CATEGORY_LOOKUP', '/categoryLookup.action');
--







--
delete from HI_Language where ID = 200100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(200100, 0, '分类列表', 1, 0);
--
delete from HI_Language where ID = 200101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(200101, 0, '父ID', 'Category', 1, 0);
--
delete from HI_Language where ID = 200102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(200102, 0, '分类名称', 'Category', 1, 0);
--
delete from HI_Language where ID = 200103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(200103, 0, '分类图片', 'Category', 1, 0);
--
delete from HI_Language where ID = 200104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(200104, 0, '分类排序', 'Category', 1, 0);
--
delete from HI_Language where ID = 200105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(200105, 0, '分类状态', 'Category', 1, 0);
--
delete from HI_Language where ID = 200106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(200106, 0, '分享数', 'Category', 1, 0);
--
delete from HI_Language where ID = 200107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(200107, 0, '图片数', 'Category', 1, 0);
--
delete from HI_Language where ID = 200108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(200108, 0, '收藏数', 'Category', 1, 0);
--
delete from HI_Language where ID = 200109;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(200109, 0, '删除标记', 'Category', 1, 0);
