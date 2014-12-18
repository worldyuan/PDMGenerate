<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/manage/taglib.jsp"%>
<div id="${entityName ? uncap_first}ToolBar" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="${entityName ? uncap_first}.toAdd(800, 500, '添加数据');">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="${entityName ? uncap_first}.toEdit(800, 500, '修改数据');">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="${entityName ? uncap_first}.deleteByIds();">删除</a>
        <input class="easyui-searchbox"/>
    </div>
</div>

<table id="${entityName ? uncap_first}Table" class="easyui-datagrid" data-options="
    pageList : [15,30,50,100],
    pageSize : 15,
    url : '${"$"}{basePath}manage/${entityName ? uncap_first}/query.action',
    rownumbers : true,
    pagination : true,
    toolbar : '${"#"}${entityName ? uncap_first}ToolBar',
    striped : true,
    fitColumns : true,
    border : false,
    fit : true">
    <thead>
        <tr>
            <#list columnList as f>
            <th data-options="field : '${f.name}'<#if f.name=='id'>, checkbox : true</#if>" width="10">${f.nameCN}</th>
            </#list>
        </tr>
    </thead>
</table>
<div id="add_${entityName ? uncap_first}_Window" title="添加数据"></div>
<div id="edit_${entityName ? uncap_first}_Window" title="修改数据"></div>