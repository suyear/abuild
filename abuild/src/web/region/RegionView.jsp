<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>

<h2 class="contentTitle"><hi:text key="查看页面"  parameterLanguageKeys="城市列表"/></h2>
<div class="pageContent">
	
	<div class="viewInfo" layoutH="97">
				
		<dl>
			<dt><hi:text key="城市名称" entity="Region"/>：</dt><dd>${region.city_name}</dd>
		</dl>
		<dl>
			<dt><hi:text key="父城市名称" entity="Region"/>：</dt><dd>${region.parent_id}</dd>
		</dl>
		<dl>
			<dt><hi:text key="城市排序" entity="Region"/>：</dt><dd>${region.sort}</dd>
		</dl>
		<dl>
			<dt><hi:text key="删除标记" entity="Region"/>：</dt><dd>${region.is_delete}</dd>
		</dl>

		<div class="divider"></div>
			</div>

	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button"><hi:text key="关闭"/></button></div></div></li>
		</ul>
	</div>
</div>
