
delete from HiMenu where ID = 800000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(800000, 0, 'member', '会员管理', '会员管理', 0, 9999, 0);
--



delete from MenuLink where ID = 800100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(800100, 0, '/memberList.action', '会员列表', '会员列表', 800100, 9999, 800000, 0, 0);
--



delete from HI_Authority where ID = 800100;
--
delete from HI_Authority where ID = 800101;
--
delete from HI_Authority where ID = 800102;
--
delete from HI_Authority where ID = 800103;
--
delete from HI_Authority where ID = 800104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(800100, 0, 'MEMBER_LIST', 'member.MemberList', '', '会员列表查询', 1, 800100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(800101, 0, 'MEMBER_VIEW', 'member.MemberView', '', '会员列表查看', 2, 800100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(800102, 0, 'MEMBER_SAVE', 'member.MemberSave', '', '会员列表保存', 3, 800100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(800103, 0, 'MEMBER_DEL', 'member.MemberDel', '', '会员列表删除', 4, 800100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(800104, 0, 'MEMBER_LOOKUP', 'member.MemberLookup', '', '会员列表带回', 1, 800100);
--

delete from HI_PrivilegeResource where ID = 800100;
--
delete from HI_PrivilegeResource where ID = 800101;
--
delete from HI_PrivilegeResource where ID = 800102;
--
delete from HI_PrivilegeResource where ID = 800103;
--
delete from HI_PrivilegeResource where ID = 800104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(800100, 0, 'MEMBER_LIST', '/memberList.action', 'com.juximao.member.service.MemberManager.getSecurityMemberList', 'MEMBER_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(800101, 0, 'MEMBER_VIEW', '/memberView.action', 'com.juximao.member.service.MemberManager.getSecurityMemberById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(800102, 0, 'MEMBER_SAVE', '/memberSave.action', 'com.juximao.member.service.MemberManager.saveSecurityMember');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(800103, 0, 'MEMBER_DEL', '/memberRemove.action', 'com.juximao.member.service.MemberManager.removeSecurityMemberById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(800104, 0, 'MEMBER_LOOKUP', '/memberLookup.action');
--







--
delete from HI_Language where ID = 800100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(800100, 0, '会员列表', 1, 0);
--
delete from HI_Language where ID = 800101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800101, 0, '分组名称', 'Member', 1, 0);
--
delete from HI_Language where ID = 800102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800102, 0, '城市名称', 'Member', 1, 0);
--
delete from HI_Language where ID = 800103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800103, 0, '邮箱', 'Member', 1, 0);
--
delete from HI_Language where ID = 800104;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800104, 0, '会员名', 'Member', 1, 0);
--
delete from HI_Language where ID = 800105;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800105, 0, '密码', 'Member', 1, 0);
--
delete from HI_Language where ID = 800106;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800106, 0, '性别', 'Member', 1, 0);
--
delete from HI_Language where ID = 800107;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800107, 0, '头像', 'Member', 1, 0);
--
delete from HI_Language where ID = 800108;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800108, 0, '积分', 'Member', 1, 0);
--
delete from HI_Language where ID = 800109;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800109, 0, '粉丝数', 'Member', 1, 0);
--
delete from HI_Language where ID = 800110;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800110, 0, '关注数', 'Member', 1, 0);
--
delete from HI_Language where ID = 800111;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800111, 0, '是否删除', 'Member', 1, 0);
--
delete from HI_Language where ID = 800112;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800112, 0, '分享数', 'Member', 1, 0);
--
delete from HI_Language where ID = 800113;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(800113, 0, '简介', 'Member', 1, 0);
