<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<table id="myTable" border="0" width="100">
	<thead>
		<tr>
			<th class="checkbox"><input type="checkbox"></th>
<#list pdmT.columns as f>
<#if f.code != 'id'>
			<th>${f.name}</th>
</#if>
</#list>
    		<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="${pdmT.code ? uncap_first}" items="${'$'}{pager.dataList}" varStatus="status">
		<tr>
			<td style="text-align: center;"><input type="checkbox" name="ids" value="${'$'}{${pdmT.code ? uncap_first}.id}"></td>
			<#list pdmT.columns as f>
			<#if f.code != 'id'>
			<td>${'$'}{${pdmT.code ? uncap_first}.${f.code} }</td>
			</#if>
    		</#list>
			<td>
				<a href="${'$'}{ctx}/manage/${pdmT.code ? uncap_first}/toEdit.action?id=${'$'}{${pdmT.code ? uncap_first}.id}" func="get" target="#content">修改</a>
				&nbsp;
				<a href="${'$'}{ctx}/manage/${pdmT.code ? uncap_first}/delete.action?id=${'$'}{${pdmT.code ? uncap_first}.id}" func="get" target="#content">删除</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<br/>
<%@ include file="/WEB-INF/jsp/include/pager.jsp"%>