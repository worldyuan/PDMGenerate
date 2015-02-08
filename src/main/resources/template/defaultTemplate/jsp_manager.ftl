<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>

<div style="width:100%;position:absolute;" id="content">
<section class="alert">
	<form method="link" action="page-new.html">
		 <button class="green" func="get" target="#content" href="${'$'}{ctx }/manage/${pdmT.code ? uncap_first}/toAdd.action">新建${pdmT.name}</button>
	</form>
</section>
<form action="${'$'}{ctx }/manage/${pdmT.code ? uncap_first}/toManager.action" target="#content">
	<section class="content">
		<section class="widget">
			<header>
				<span class="icon">&#128100;</span>
				<hgroup>
					<h1>${pdmT.name}</h1>
					<h2>当前${pdmT.name}信息</h2>
				</hgroup>
				<aside>
					<span>
						<a href="#">&#9881;</a>
						<ul class="settings-dd">
							<li><label>Option a</label><input type="checkbox" checked="checked" /></li>
							<li><label>Option b</label><input type="checkbox" checked="checked" /></li>
							<li><label>Option c</label><input type="checkbox" checked="checked" /></li>
						</ul>
					</span>
				</aside>
			</header>
			<div class="content">
				<jsp:include page="query.jsp"></jsp:include>
			</div>
		</section>
	</section>
</form>
</div>
<script>
$("#myTable").tablesorter({headers:{0:{sorter:false},4:{sorter:false}}});
</script>
<script src="${'$'}{ctx }/theme/${'$'}{sessionScope.theme}/js/custom.js"></script>
