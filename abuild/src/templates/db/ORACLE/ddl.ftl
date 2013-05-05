<#list service.entity as entity><#if entity.entityType != 2 && serviceTool.hasInEntity(entity.entityName, entitySet)><#if drop>
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE ${entity.tableName}';
EXCEPTION WHEN OTHERS THEN
    NULL;
END;
/---
</#if>
<#compress>
<#assign totalCount = 0>
<#assign count = 0>
<#assign hasPrimaryKey = false>
<#assign primaryKeyName =''>
<#list entity.field as property>
	<#if (property.fieldType == 6 || property.fieldType == 8) && property.lookupEntity.isLkForeignKey>
		<#assign totalCount = totalCount + 1>
	</#if>
	<#if property.fieldType != 6  &&  property.fieldType != 8>
		<#assign totalCount = totalCount + 1>
	</#if>
	<#if !hasPrimaryKey && property.isPrimaryKey>
		<#assign hasPrimaryKey = true>
		<#assign primaryKeyName = property.fieldName>
	</#if>
</#list>
</#compress>
CREATE TABLE ${entity.tableName} (
<#list entity.field as field><#assign fieldType = field.fieldType><#if (fieldType == 6 || fieldType == 8)&& field.lookupEntity.isLkForeignKey><#assign count = count + 1>    ${field.fieldName} number <#if field.isFull>NOT</#if> NULL<#if count != totalCount>,${'\n'}</#if><#else><#if fieldType != 6 && fieldType != 8><#assign count = count + 1><#include "ddl-field.ftl"></#if></#if></#list> )
/---
<#if entity.entityType != 3>
ALTER TABLE ${entity.tableName} ADD (
      CONSTRAINT pk_${entity.tableName} PRIMARY KEY (${serviceTool.getPKField(entity).fieldName})
)

</#if>
/---
</#if>

</#list>