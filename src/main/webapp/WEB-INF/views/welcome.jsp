<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
</head>
<body>
	<h1>Selemat datang di ${title}</h1>
	<p>Ini adalah aplikasi demo untuk manajemen konsumen</p>
	<a href="<c:url value="/konsumen/" />">Konsumen</a>
</body>
</html>