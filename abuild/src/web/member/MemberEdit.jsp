<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>

<h2 class="contentTitle"><hi:text key="编辑页面" parameterLanguageKeys="会员列表"/></h2>
<form action="memberEditSave.action?navTabId=memberList&callbackType=closeCurrent&ajax=1" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
<div class="pageContent">
	<div class="pageFormContent" layoutH="97">
		<dl>
			<dt><hi:text key="会员名" entity="Member"/>：</dt><dd><input type="text" name="member.member_name" class="textInput required" value="${member.member_name}" maxlength="50"/></dd>
		</dl>
		<dl>
			<dt><hi:text key="密码" entity="Member"/>：</dt><dd><input type="text" name="member.password" class="textInput required" value="${member.password}" maxlength="50"/></dd>
		</dl>
		<dl>
			<dt><hi:text key="描述" entity="Member"/>：</dt><dd><input type="text" name="member.description" class="textInput" value="${member.description}" maxlength="300"/></dd>
		</dl>
		<input type="hidden" name="member.id" value="${member.id}"/>
		<input type="hidden" name="member.version" value="${member.version}"/>

		<div class="divider"></div>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit"><hi:text key="保存"/></button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button"><hi:text key="关闭"/></button></div></div></li>
		</ul>
	</div>  
</div>
</form>
