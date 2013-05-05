<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>

<h2 class="contentTitle"><hi:text key="编辑页面" parameterLanguageKeys="城市列表"/></h2>
<form action="regionSave.action?navTabId=regionList&callbackType=closeCurrent&ajax=1" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
<div class="pageContent">
	<div class="pageFormContent" layoutH="97">
		<dl>
			<dt><hi:text key="城市名称" entity="Region"/>：</dt><dd><input type="text" name="region.city_name" class="textInput required" value="${region.city_name}" maxlength="50"/></dd>
		</dl>
		<dl>
			<dt><hi:text key="父城市名称" entity="Region"/>：</dt>
			<dd>
				<input type="hidden"  id="idname1" name="region.parent_id.id" value="${region.id}"/>
		    	<select name="region.id" id="regionides" >
		    
			</select> 
				
				
			
			</dd>
		</dl>
			 <script type="text/javascript">
        var parentid=document.getElementById("idname1").value;
            var listArr=${listArr};      
            var list={}; 
      
            $.each(listArr,function(i,v){
            	if(!v.parent_id)
            		v.parent_id=0;
                if(-v.parent_id==0)
                {
                    if(!list[v.id]){
                        list[v.id]={};  
                        list[v.id]["child"]=[]; 
                    }
                    list[v.id]["parent"]=v;
                }else{
                    if(!list[v.parent_id])
                    {
                        list[v.parent_id]={};
                        list[v.parent_id]["child"]=[];                      
                    }
                    list[v.parent_id]["child"].push(v);
                }           
            });
          
            var parent_tag_select=$("#regionides");
            $.each(list,function(i,v){
                var _option=$('<option></option>');
                _option.val(v.parent.id).text(v.parent.city_name);
                parent_tag_select.append(_option);  
                $.each(v.child,function(j,c){
                    var _optionChild=$('<option></option>');
                    _optionChild.val(c.id).html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+c.city_name);
                    parent_tag_select.append(_optionChild);
                });
            });
        
            parent_tag_select.val(parentid);
            
        
            
        </script>
		
		<dl>
			<dt><hi:text key="城市排序" entity="Region"/>：</dt><dd><input type="text" name="region.sort" class="textInput integer" value="${region.sort}" alt="<hi:text key="请输入整数"/>"/></dd>
		</dl>
		<dl   style="display: none;">
			<dt><hi:text key="删除标记" entity="Region"/>：</dt><dd><input type="hidden" name="region.is_delete" class="textInput" value="${region.is_delete}" maxlength="2"/></dd>
		</dl>
				<input type="hidden" name="region.id" value="${region.id}"/>
				<input type="hidden" name="region.create_user" value="${region.create_user}"/>
				<input type="hidden" name="region.create_date" value="${region.create_date}"/>
				<input type="hidden" name="region.update_user" value="${region.update_user}"/>
				<input type="hidden" name="region.update_date" value="${region.update_date}"/>
				<input type="hidden" name="region.creator.id" value="${region.creator.id}"/>
				<input type="hidden" name="region.version" value="${region.version}"/>

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
