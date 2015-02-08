<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/manage/taglib.jsp"%>
<form action="${'$'}{basePath}/manage/${entityName ? uncap_first}/add.action" method="post" id="add_${entityName ? uncap_first}_form">
    <table class="common_table">
        <#list columnList as f>
        <#if f.name == 'id'></#if>
        <#if f.name != 'id'>
        <tr>
            <th width="30%" align="right">${f.nameCN}：</th>
            <td width="70%"><input class="input_240" type="text" name="${f.name}"/></td>
        </tr>
        </#if>
        </#list>
    </table>
</form>
<div class="floatright absolute_right_botton_10px">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="${entityName ? uncap_first}.add()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="${entityName ? uncap_first}.cancelAdd()">关闭</a>
</div>