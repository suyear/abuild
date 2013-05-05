
delete from HiMenu where ID = 1000000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(1000000, 0, 'goods', '商品管理', '商品管理', 0, 9999, 0);
--



delete from MenuLink where ID = 1000100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(1000100, 0, '/goodsList.action', '商品管理', '商品管理', 1000100, 9999, 1000000, 0, 0);
--



delete from HI_Authority where ID = 1000100;
--
delete from HI_Authority where ID = 1000101;
--
delete from HI_Authority where ID = 1000102;
--
delete from HI_Authority where ID = 1000103;
--
delete from HI_Authority where ID = 1000104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000100, 0, 'GOODS_LIST', 'goods.GoodsList', '', '商品管理查询', 1, 1000100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000101, 0, 'GOODS_VIEW', 'goods.GoodsView', '', '商品管理查看', 2, 1000100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000102, 0, 'GOODS_SAVE', 'goods.GoodsSave', '', '商品管理保存', 3, 1000100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000103, 0, 'GOODS_DEL', 'goods.GoodsDel', '', '商品管理删除', 4, 1000100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000104, 0, 'GOODS_LOOKUP', 'goods.GoodsLookup', '', '商品管理带回', 1, 1000100);
--

delete from HI_PrivilegeResource where ID = 1000100;
--
delete from HI_PrivilegeResource where ID = 1000101;
--
delete from HI_PrivilegeResource where ID = 1000102;
--
delete from HI_PrivilegeResource where ID = 1000103;
--
delete from HI_PrivilegeResource where ID = 1000104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(1000100, 0, 'GOODS_LIST', '/goodsList.action', 'com.juximao.goods.service.GoodsManager.getSecurityGoodsList', 'GOODS_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1000101, 0, 'GOODS_VIEW', '/goodsView.action', 'com.juximao.goods.service.GoodsManager.getSecurityGoodsById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1000102, 0, 'GOODS_SAVE', '/goodsSave.action', 'com.juximao.goods.service.GoodsManager.saveSecurityGoods');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1000103, 0, 'GOODS_DEL', '/goodsRemove.action', 'com.juximao.goods.service.GoodsManager.removeSecurityGoodsById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(1000104, 0, 'GOODS_LOOKUP', '/goodsLookup.action');
--







--
delete from HI_Language where ID = 1000100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(1000100, 0, '商品管理', 1, 0);
--
delete from HI_Language where ID = 1000101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000101, 0, '标题', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000102, 0, '服务简介', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000103, 0, '服务特色', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000104, 0, '可选服务', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000105, 0, '价格', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000106, 0, '创建时间', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000107, 0, '购买次数', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000108, 0, '是否热门', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000109;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000109, 0, '是否推荐', 'Goods', 1, 0);
