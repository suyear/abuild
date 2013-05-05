
delete from HiMenu where ID = 1200000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(1200000, 0, 'orders', '订单管理', '订单管理', 0, 9999, 0);
--



delete from MenuLink where ID = 1200100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(1200100, 0, '/ordersList.action', '订单列表', '订单列表', 1200100, 9999, 1200000, 0, 0);
--



delete from HI_Authority where ID = 1200100;
--
delete from HI_Authority where ID = 1200101;
--
delete from HI_Authority where ID = 1200102;
--
delete from HI_Authority where ID = 1200103;
--
delete from HI_Authority where ID = 1200104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1200100, 0, 'ORDERS_LIST', 'orders.OrdersList', '', '订单列表查询', 1, 1200100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1200101, 0, 'ORDERS_VIEW', 'orders.OrdersView', '', '订单列表查看', 2, 1200100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1200102, 0, 'ORDERS_SAVE', 'orders.OrdersSave', '', '订单列表保存', 3, 1200100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1200103, 0, 'ORDERS_DEL', 'orders.OrdersDel', '', '订单列表删除', 4, 1200100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(1200104, 0, 'ORDERS_LOOKUP', 'orders.OrdersLookup', '', '订单列表带回', 1, 1200100);
--

delete from HI_PrivilegeResource where ID = 1200100;
--
delete from HI_PrivilegeResource where ID = 1200101;
--
delete from HI_PrivilegeResource where ID = 1200102;
--
delete from HI_PrivilegeResource where ID = 1200103;
--
delete from HI_PrivilegeResource where ID = 1200104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(1200100, 0, 'ORDERS_LIST', '/ordersList.action', 'com.juximao.orders.service.OrdersManager.getSecurityOrdersList', 'ORDERS_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1200101, 0, 'ORDERS_VIEW', '/ordersView.action', 'com.juximao.orders.service.OrdersManager.getSecurityOrdersById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1200102, 0, 'ORDERS_SAVE', '/ordersSave.action', 'com.juximao.orders.service.OrdersManager.saveSecurityOrders');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(1200103, 0, 'ORDERS_DEL', '/ordersRemove.action', 'com.juximao.orders.service.OrdersManager.removeSecurityOrdersById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(1200104, 0, 'ORDERS_LOOKUP', '/ordersLookup.action');
--







--
delete from HI_Language where ID = 1200100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(1200100, 0, '订单列表', 1, 0);
--
delete from HI_Language where ID = 1200101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200101, 0, '省份ID', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200102, 0, '城市ID', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200103, 0, '商品ID(分享ID)', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200104, 0, '订单类型', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200105, 0, '买家姓名', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200106, 0, '价格', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200107, 0, '定金', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200108, 0, '会员QQ', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200109;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200109, 0, '联系方式', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200110;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200110, 0, '买家地址', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200111;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200111, 0, '邮箱', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200112;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200112, 0, 'IP地址', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200113;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200113, 0, '支付状态', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200114;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200114, 0, '支付方式', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200115;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200115, 0, '处理状态', 'Orders', 1, 0);
--
delete from HI_Language where ID = 1200116;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(1200116, 0, '删除标记', 'Orders', 1, 0);
