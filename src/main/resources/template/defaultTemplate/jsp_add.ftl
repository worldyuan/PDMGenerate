<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<section class="content" style="margin-top: 0">
<form action="${'$'}{ctx }/manage/${pdmT.code ? uncap_first}/add.action" target="#content" id="add_${pdmT.code ? uncap_first}_form"  method="post">
	<table id="myTable" border="0" width="100">
		<tbody>
	<#list pdmT.columns as f>
	<#if f.code != 'id'>
			<tr>
	        	<th style="text-align: right;">${f.name}</th>
	        	<td><input name="${f.code}" value="${'$'}{${pdmT.code ? uncap_first}.${f.code}}" type="text"/></td>
			</tr>
	</#if>
    </#list>
    	<tbody>
    </table>
    <br/>
	<div style="text-align: center;">
		<button type="button" class="green" func="form" update>保存</button>
		<button type="button">返回</button>
	</div>
</form>
</section>