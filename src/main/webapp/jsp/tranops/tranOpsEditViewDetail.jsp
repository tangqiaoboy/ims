<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.xuexibao.ops.enumeration.TranOpsAuditStatus" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="keywords" content=""/>
<meta http-equiv="description" content=""/>
<title>查看试题</title>
<link type="image/x-icon" rel="shortcut icon" href="<%=basePath %>image/exam/favicon.ico">
<link href="<%=basePath %>css/bootstrap/static2.0.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath %>css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="crumb">当前位置：查看试题</div>
	<div class="static2_base articleDetail">
		<h2>题目内容</h2>
		<div class="p2em bor_bottom mb20">
			<p>
				<span>题目id：${ tranOps.id }</span>
				<span class="ml10">科目：${ tranOps.subject }</span>
			</p>
			<div class="articleContent">${ tranOps.content }</div>
		</div>
		<h2>答案</h2>
		<div class="p2em bor_bottom mb20">
			<div class="articleContent">${ tranOps.answer }</div>
		</div>
		<h2>解题思路</h2>
		<div class="p2em bor_bottom mb20">
			<div class="articleContent">${ tranOps.solution }</div>
		</div>
		<h2>知识点</h2>
		<div class="p2em bor_bottom mb20">
			<div class="articleContent">${ tranOps.knowledge }</div>
		</div>
		<h2>审核意见</h2>
		<div class="p2em  mb20">
			<c:set var="AUDIT_THROUGH" value="<%= TranOpsAuditStatus.AUDIT_THROUGH %>"/>
			<c:set var="AUDIT_NOT_THROUGH" value="<%= TranOpsAuditStatus.AUDIT_NOT_THROUGH %>"/>
			<c:set var="PENDING_AUDIT" value="<%= TranOpsAuditStatus.PENDING_AUDIT %>"/>
			<c:set var="HALF_THROUGH" value="<%= TranOpsAuditStatus.HALF_THROUGH %>"/>
			<c:if test="${ AUDIT_THROUGH.id == tranOps.auditStatus || PENDING_AUDIT.id == tranOps.auditStatus || HALF_THROUGH.id == tranOps.auditStatus }">
			<p class="co_red">审核结果：${ tranOps.statusForShow }</p>
			</c:if>
			<c:if test="${ AUDIT_NOT_THROUGH.id == tranOps.auditStatus }">
			<p class="co_red">审核结果：${ tranOps.statusForShow }，原因：${ tranOps.lastTranOpsApprove.reason }</p>
			</c:if>
		</div>
		<div class="center_margin">
			<a class="btn btn-default" href="<%=basePath %>tranops/tranOpsEditSearch">返回</a>
		</div>
	</div>
</body>
</html>
