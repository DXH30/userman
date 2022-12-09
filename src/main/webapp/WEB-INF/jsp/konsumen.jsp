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
	<h1>Selamat Datang</h1>
	<table border="1">
		<thead>
			<th>Nama</th>
			<th>Alamat</th>
			<th>Kota</th>
			<th>Provinsi</th>
			<th>Tgl Registrasi</th>
			<th>Status</th>
			<th>Aksi</th>
		</thead>
		<tbody>
			<tr>
				<form action="/konsumen/add" method="POST">
				<td><input type="text" name="nama" placeholder="Nama" /></td>
				<td><input type="text" name="alamat" placeholder="Alamat" /></td>
				<td><input type="text" name="kota" placeholder="Kota" /></td>
				<td><input type="text" name="provinsi" placeholder="Provinsi" /></td>
				<td></td>
				<td><select name="status">
						<option value="AKTIF">AKTIF</option>
						<option value="NONAKTIF">NONAKTIF</option>
				</select></td>
				<td><input type="submit" value="Tambah"></td>
				</form>
			</tr>
			<c:forEach items="${konsumen}" var="item">
				<tr>
					<td>${item.getNama()}</td>
					<td>${item.getAlamat() }</td>
					<td>${item.getKota() }</td>
					<td>${item.getProvinsi() }</td>
					<td>${item.getTglRegistrasi() }</td>
					<td>${item.getStatus() }</td>
					<td><a href="delete?id=${item.getId() }">Hapus</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>