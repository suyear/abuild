
delete from HiMenu where ID = 400000;
--
insert into HiMenu(ID, version, menuName, displayRef, description, parentMenu, sequence, creator) values(400000, 0, 'comment', '���۹���', '���۹���', 0, 9999, 0);
--



delete from MenuLink where ID = 400100;
--
insert into MenuLink(ID, version, linkUrl, displayRef, description, authority, sequence, menu, menuLinkType, creator) values(400100, 0, '/commentList.action', '�����б�', '�����б�', 400100, 9999, 400000, 0, 0);
--



delete from HI_Authority where ID = 400100;
--
delete from HI_Authority where ID = 400101;
--
delete from HI_Authority where ID = 400102;
--
delete from HI_Authority where ID = 400103;
--
delete from HI_Authority where ID = 400104;
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(400100, 0, 'COMMENT_LIST', 'comment.CommentList', '', '�����б��ѯ', 1, 400100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(400101, 0, 'COMMENT_VIEW', 'comment.CommentView', '', '�����б�鿴', 2, 400100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(400102, 0, 'COMMENT_SAVE', 'comment.CommentSave', '', '�����б���', 3, 400100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(400103, 0, 'COMMENT_DEL', 'comment.CommentDel', '', '�����б�ɾ��', 4, 400100);
--
insert into HI_Authority(ID, version, authorityName, displayRef, propertedResource, description, authorityType, menuLink) values(400104, 0, 'COMMENT_LOOKUP', 'comment.CommentLookup', '', '�����б����', 1, 400100);
--

delete from HI_PrivilegeResource where ID = 400100;
--
delete from HI_PrivilegeResource where ID = 400101;
--
delete from HI_PrivilegeResource where ID = 400102;
--
delete from HI_PrivilegeResource where ID = 400103;
--
delete from HI_PrivilegeResource where ID = 400104;
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer, bizExtAuthNames) values(400100, 0, 'COMMENT_LIST', '/commentList.action', 'com.juximao.comment.service.CommentManager.getSecurityCommentList', 'COMMENT_LOOKUP');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(400101, 0, 'COMMENT_VIEW', '/commentView.action', 'com.juximao.comment.service.CommentManager.getSecurityCommentById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(400102, 0, 'COMMENT_SAVE', '/commentSave.action', 'com.juximao.comment.service.CommentManager.saveSecurityComment');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer, businessLayer) values(400103, 0, 'COMMENT_DEL', '/commentRemove.action', 'com.juximao.comment.service.CommentManager.removeSecurityCommentById');
--
insert into HI_PrivilegeResource(ID, version, authorityName, viewLayer) values(400104, 0, 'COMMENT_LOOKUP', '/commentLookup.action');
--







--
delete from HI_Language where ID = 400100;
--
insert into HI_Language(ID, version, keyStr, creator, isSystem) values(400100, 0, '�����б�', 1, 0);
--
delete from HI_Language where ID = 400101;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(400101, 0, '�û���', 'Comment', 1, 0);
--
delete from HI_Language where ID = 400102;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(400102, 0, '��������', 'Comment', 1, 0);
--
delete from HI_Language where ID = 400103;
--
insert into HI_Language(ID, version, keyStr, entity, creator, isSystem) values(400103, 0, 'ɾ�����', 'Comment', 1, 0);
