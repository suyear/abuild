<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>

<form id="pagerForm" action="memberList.action">
	<input type="hidden" name="pageInfo.currentPage" value="${pageInfo.currentPage}" />
	<input type="hidden" name="pageInfo.sorterName" value="${pageInfo.sorterName}" />
	<input type="hidden" name="pageInfo.sorterDirection" value="${pageInfo.sorterDirection}" />
	<input type="hidden" name="lookup" value="${lookup}" />
</form>

<div class="pageHeader">
	<form id="member_find_form" rel="pagerForm" method="post" action="" onsubmit="return dwzSearch(this, '${targetType}');">
	<input type="hidden" name="pageInfo.pageSize" value="${pageInfo.pageSize}" />
	<div class="searchBar">
		<ul class="searchContent">	
			<li>
				<label><hi:text key="会员名" entity="Member"/>:</label>
				<input type="text" name="pageInfo.f_member_name" value="${f_member_name}"/>
			</li>	
		</ul>
		<div class="subBar">
			<div class="buttonActive"><div class="buttonContent"><button type="submit" onclick="checkaction(0)"><hi:text key="查询"/></button></div></div>
			<div class="buttonActive"><div class="buttonContent"><button type="submit" onclick="checkaction(1)"><hi:text key="导出"/></button></div></div>
		</div>
	</div>
	</form>
	<script>
	function checkaction(v){ 
		var from = $("#member_find_form");
		if(v==0){ 
			//onsubmit=""
			
			from .attr("action","memberList.action?lookup=${lookup}").attr("target","");
			var onsubmit=from.attr("onsubmit");
			if(!onsubmit)
			{
				from.submit(function(){
					return dwzSearch(this, '${targetType}');
				});			
			}
		}else{ 
			from.attr("action","MemberExport.action").attr("target","_blank");
			var onsubmit=from .attr("onsubmit");
			if(onsubmit!="")
			{
				from .attr("onsubmit_bak",from .attr("onsubmit")).removeAttr("onsubmit");
			}
		}
	}
	</script>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="<hi:url>memberEdit.action?member.id=-1</hi:url>" target="navTab" rel="member"><span><hi:text key="新建" parameterLanguageKeys="会员列表"/></span></a></li>
			<li><a class="delete" href="<hi:url>memberRemoveAll.action?ajax=1</hi:url>" target="removeSelected" title="<hi:text key="确实要删除这些记录吗?"/>"><span><hi:text key="批量删除"/></span></a></li>
			<li><a class="icon" href="javascript:$.bringBack({id:'-1',member_name:'',password:'',description:'description'})"><span><hi:text key="重置"/></span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138" targetType="${targetType}">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="orderIndexs" class="checkboxCtrl"></th>
				<th orderField="member_name" class="${pageInfo.sorterName eq 'member_name' ? pageInfo.sorterDirection : ''}"><hi:text key="会员名" entity="Member"/></th>				
				<th orderField="password" class="${pageInfo.sorterName eq 'password' ? pageInfo.sorterDirection : ''}"><hi:text key="密码" entity="Member"/></th>	
				<th orderField="description" class="${pageInfo.sorterName eq 'description' ? pageInfo.sorterDirection : ''}"><hi:text key="描述" entity="Member"/></th>
				<th width="90">
					<c:choose>
						<c:when test="${empty lookup}"><hi:text key="操作"/></c:when>
						<c:otherwise><hi:text key="查找带回"/></c:otherwise>
					</c:choose>
				</th>
			</tr>
		</thead>				
		<tbody>
			<c:forEach var="item" items="${members}" varStatus="s">
			<tr>
				<c:if test="${empty lookup}">
				<td><input name="orderIndexs" value="${item.id}" type="checkbox"></td>
				</c:if>			
				    <td>${item.member_name}</td>
				    <td>${item.password}</td>
				    <td>${item.description}</td>
				<td>
				      <a class="btnDel" href="<hi:url>memberRemove.action?ajax=1&member.id=${item.id}</hi:url>" target="navTabTodo" title="<hi:text key="删除" parameterLanguageKeys="会员列表"/>"><hi:text key="删除"/></a>
				      <a class="btnView" href="<hi:url>memberView.action?member.id=${item.id}</hi:url>" target="navTab" rel="member" title="<hi:text key="查看" parameterLanguageKeys="会员列表"/>"><hi:text key="查看"/></a>
				      <a class="btnEdit" href="<hi:url>memberEdit.action?member.id=${item.id}</hi:url>" target="navTab" rel="member" title="<hi:text key="编辑" parameterLanguageKeys="会员列表"/>"><hi:text key="编辑"/></a>
				    <!-- ------------------------改为默认密码---------------------------------------- -->
				      <a class="btnLook" href="<hi:url>ReturnDefaultPwd.action?ajax=1&member.id=${item.id}</hi:url>" target="navTabTodo" rel="member" title="<hi:text key="修改为" parameterLanguageKeys="默认密码"/>"><hi:text key="修改"/></a>
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


