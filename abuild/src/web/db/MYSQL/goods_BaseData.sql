
delete from HiMenu where ID = 1000000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(1000000, 0, 'goods', '��Ʒ����', '��Ʒ����', 0, 9999, 0);
--



delete from MenuLink where ID = 1000100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(1000100, 0, '/goodsList.action', '��Ʒ����', '��Ʒ����', 1000100, 9999, 1000000, 0, 0);
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
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000100, 0, 'GOODS_LIST', 'goods.GoodsList', '', '��Ʒ�����ѯ', 1, 1000100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000101, 0, 'GOODS_VIEW', 'goods.GoodsView', '', '��Ʒ����鿴', 2, 1000100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000102, 0, 'GOODS_SAVE', 'goods.GoodsSave', '', '��Ʒ������', 3, 1000100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000103, 0, 'GOODS_DEL', 'goods.GoodsDel', '', '��Ʒ����ɾ��', 4, 1000100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1000104, 0, 'GOODS_LOOKUP', 'goods.GoodsLookup', '', '��Ʒ�������', 1, 1000100);
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
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(1000100, 0, '��Ʒ����', 1, 0);
--
delete from HI_Language where ID = 1000101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000101, 0, '����', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000102, 0, '������', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000103, 0, '������ɫ', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000104, 0, '��ѡ����', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000105, 0, '�۸�', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000106, 0, '����ʱ��', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000107, 0, '�������', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000108, 0, '�Ƿ�����', 'Goods', 1, 0);
--
delete from HI_Language where ID = 1000109;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1000109, 0, '�Ƿ��Ƽ�', 'Goods', 1, 0);
