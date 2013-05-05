<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>

<h2 class="contentTitle"><hi:text key="查看页面"  parameterLanguageKeys="会员列表"/></h2>
<div class="pageContent">
	
	<div class="viewInfo" layoutH="97">
		<dl>
			<dt><hi:text key="会员名" entity="Member"/>：</dt><dd>${member.member_name}</dd>
		</dl>
		<dl>
			<dt><hi:text key="密码" entity="Member"/>：</dt><dd>${member.password}</dd>
		</dl>
		<dl>
			<dt><hi:text key="简介" entity="Member"/>：</dt><dd>${member.description}</dd>
		</dl>

		<div class="divider"></div>
			</div>

	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button"><hi:text key="关闭"/></button></div></div></li>
		</ul>
	</div>
</div>
