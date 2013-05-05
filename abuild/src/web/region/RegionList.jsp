<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>

<form id="pagerForm" action="regionList.action">
	<input type="hidden" name="pageInfo.currentPage" value="${pageInfo.currentPage}" />
	<input type="hidden" name="pageInfo.sorterName" value="${pageInfo.sorterName}" />
	<input type="hidden" name="pageInfo.sorterDirection" value="${pageInfo.sorterDirection}" />
	<input type="hidden" name="lookup" value="${lookup}" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" method="post" action="regionList.action?lookup=${lookup}" onsubmit="return dwzSearch(this, '${targetType}');">
	<input type="hidden" name="pageInfo.pageSize" value="${pageInfo.pageSize}" />
	<div class="searchBar">
		<ul class="searchContent">	
			<li>
				<label><hi:text key="城市名称" entity="Region"/>:</label>
				<input type="text" name="pageInfo.f_city_name" value="${pageInfo.f_city_name}"/>
			</li>	  
			<li>
				<label><hi:text key="父城市名称" entity="Region"/>:</label>
				<input type="text" name="pageInfo.f_parent_id" value="${pageInfo.f_parent_id}"/>
			</li>	  
		</ul>
		<div class="subBar">
			<div class="buttonActive"><div class="buttonContent"><button type="submit"><hi:text key="查询"/></button></div></div>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		<c:choose>
			<c:when test="${empty lookup}">
				<authz:authorize ifAnyGranted="REGION_SAVE"><li><a class="add" href="<hi:url>regionEdit.action?region.id=-1</hi:url>" target="navTab" rel="region"><span><hi:text key="新建" parameterLanguageKeys="城市列表"/></span></a></li></authz:authorize>
				<authz:authorize ifAnyGranted="REGION_DEL"><li><a class="delete" href="<hi:url>regionRemoveAll.action?ajax=1</hi:url>" target="removeSelected" title="<hi:text key="确实要删除这些记录吗?"/>"><span><hi:text key="批量删除"/></span></a></li></authz:authorize>
			</c:when>
			<c:otherwise>
				<li><a class="icon" href="javascript:$.bringBack({id:'-1', city_name:'',parent_city_name:'',sort:'',is_delete:''})"><span><hi:text key="重置"/></span></a></li>
			</c:otherwise>
		</c:choose>			
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138" targetType="${targetType}">
		<thead>
			<tr>
				<c:if test="${empty lookup}">
				<th width="22"><input type="checkbox" group="orderIndexs" class="checkboxCtrl"></th>
				</c:if>
				<th orderField="city_name" class="${pageInfo.sorterName eq 'city_name' ? pageInfo.sorterDirection : ''}"><hi:text key="城市名称" entity="Region"/></th>
				<th orderField="parent_id" class="${pageInfo.sorterName eq 'parent_id' ? pageInfo.sorterDirection : ''}"><hi:text key="父城市名称" entity="Region"/></th>
				<th orderField="sort" class="${pageInfo.sorterName eq 'sort' ? pageInfo.sorterDirection : ''}"><hi:text key="城市排序" entity="Region"/></th>
				<th orderField="is_delete" class="${pageInfo.sorterName eq 'is_delete' ? pageInfo.sorterDirection : ''}"><hi:text key="删除标记" entity="Region"/></th>
				<th width="90">
					<c:choose>
						<c:when test="${empty lookup}"><hi:text key="操作"/></c:when>
						<c:otherwise><hi:text key="查找带回"/></c:otherwise>
					</c:choose>
				</th>
			</tr>
		</thead>				
		<tbody>
			<c:forEach var="item" items="${regions}" varStatus="s">
			<tr>
				<c:if test="${empty lookup}">
				<td><input name="orderIndexs" value="${item.id}" type="checkbox"></td>
				</c:if>			
				    <td>${item.city_name}</td>
				    <td><authz:authorize ifAnyGranted="REGION_VIEW"><a href="<hi:url>regionView.action?region.id=${item.id}&workflow=-1</hi:url>" target="dialog"></authz:authorize>
					${item.parent_id}
					<authz:authorize ifAnyGranted="REGION_VIEW"></a></authz:authorize>
					</td>
				    <td>${item.sort}</td>
				    <td >${item.isdelete}</td>
				<td>
				<c:choose>
					<c:when test="${empty lookup}">
				    <authz:authorize ifAnyGranted="REGION_DEL">
				      <a class="btnDel" href="<hi:url>regionRemove.action?ajax=1&region.id=${item.id}&region.is_delete=${item.is_delete}</hi:url>" target="navTabTodo" title="<hi:text key="删除" parameterLanguageKeys="城市列表"/>"><hi:text key="删除"/></a>
				    </authz:authorize> 
				    <authz:authorize ifAnyGranted="REGION_VIEW">
				      <a class="btnView" href="<hi:url>regionView.action?region.id=${item.id}</hi:url>" target="navTab" rel="region" title="<hi:text key="查看" parameterLanguageKeys="城市列表"/>"><hi:text key="查看"/></a>
				    </authz:authorize>
				    <authz:authorize ifAnyGranted="REGION_SAVE">
				      <a class="btnEdit" href="<hi:url>regionEdit.action?region.id=${item.id}</hi:url>" target="navTab" rel="region" title="<hi:text key="编辑" parameterLanguageKeys="城市列表"/>"><hi:text key="编辑"/></a>
				    </authz:authorize>
					</c:when>
					<c:otherwise>
						<a class="btnSelect" href="javascript:$.bringBack({id:'${item.id}', city_name:'${item.city_name}',parent_city_name:'${item.parent_id.city_name}',sort:'${item.sort}',is_delete:'${item.is_delete}'})" title="<hi:text key="查找带回"/>"><hi:text key="选择"/></a>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>	
	<div class="panelBar">
		<div class="pages">
			<span><hi:text key="每页"/></span>
			<c:set var="pageSizeList" value="${fn:split('10|20|50|100', '|')}"/>  
			<select name="pageInfo.pageSize" onchange="dwzPageBreak({targetType:'${targetType}', numPerPage:this.value})">
				<c:forEach var="item" items="${pageSizeList}">
				<option value="${item}" ${item eq pageInfo.pageSize ? 'selected="selected"' : ''}>${item}</option>
				</c:forEach>
			</select>
			<span><hi:text key="条"/>，<hi:text key="共"/>${pageInfo.totalRecords}<hi:text key="条"/></span>
		</div>
		<div class="pagination" targetType="${targetType}" totalCount="${pageInfo.totalRecords}" numPerPage="${pageInfo.pageSize}" pageNumShown="${pageInfo.middlePageNum*2}" currentPage="${pageInfo.currentPage}"></div>
	</div>
</div>
