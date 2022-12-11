<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/5.2.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/webjars/datatables/1.13.1/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet"
	href="/webjars/datatables-buttons/2.3.3/css/buttons.bootstrap5.min.css">
<link rel="stylesheet"
	href="/webjars/font-awesome/6.2.0/css/all.min.css">
</head>
<body>
	<!-- As a heading -->
	<nav class="navbar navbar-light bg-light">
		<div class="container-fluid">
			<span class="navbar-brand mb-0 h1">Manajemen Konsumen</span>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<h5>Edit Konsumen</h5>
			<p>Perhatikan data konsumen sebelum mengedit.</p>
		</div>
		<form action="/konsumen/update" method="POST">
			<div class="modal-body">
				<input type="hidden" name="id" value="${konsumen.id}" />
				<div class="form-floating mb-3">
					<input class="form-control" name="nama" id="nama" type="text"
						placeholder="Nama" data-sb-validations="required"
						value="${konsumen.nama }" /> <label for="nama">Nama</label>
					<div class="invalid-feedback" data-sb-feedback="nama:required">Nama
						is required.</div>
				</div>
				<div class="form-floating mb-3">
					<textarea class="form-control" name="alamat" id="alamat"
						placeholder="Alamat" style="height: 10rem;"
						data-sb-validations="required">${konsumen.alamat }</textarea>
					<label for="alamat">Alamat</label>
					<div class="invalid-feedback" data-sb-feedback="alamat:required">Alamat
						is required.</div>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" name="kota" id="kota" type="text"
						placeholder="Kota" data-sb-validations="required"
						value="${konsumen.kota }" /> <label for="kota">Kota</label>
					<div class="invalid-feedback" data-sb-feedback="kota:required">Kota
						is required.</div>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" name="provinsi" id="provinsi"
						type="text" placeholder="Provinsi" data-sb-validations="required"
						value="${konsumen.provinsi }" /> <label for="provinsi">Provinsi</label>
					<div class="invalid-feedback" data-sb-feedback="provinsi:required">Provinsi
						is required.</div>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" name="tglRegistrasi" id="tglRegistrasi"
						type="date" placeholder="Tanggal Registrasi"
						data-sb-validations="required" value="${konsumen.tglRegistrasi }" />
					<label for="tglRegistrasi">Tanggal Registrasi</label>
					<div class="invalid-feedback"
						data-sb-feedback="tglRegistrasi:required">tglRegistrasi is
						required.</div>
				</div>
				<div class="form-floating mb-3">
					<select class="form-select" name="status" id="status"
						aria-label="Status">
						<option value="AKTIF">aktif</option>
						<option value="NONAKTIF">non-aktif</option>
					</select> <label for="status">Status</label>
				</div>
				<div class="d-grid"></div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary btn-lg" id="submitButton"
					type="submit">Simpan</button>
			</div>
		</form>

	</div>
	<script src="/webjars/bootstrap/5.2.3/js/bootstrap.min.js"></script>
	<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>

	<script src="/webjars/datatables/1.13.1/js/jquery.dataTables.min.js"></script>
	<script src="/webjars/font-awesome/6.2.0/js/all.min.js"></script>

	<script
		src="/webjars/datatables-buttons/2.3.3/js/buttons.colVis.min.js"></script>
	<script
		src="/webjars/datatables-buttons/2.3.3/js/buttons.dataTables.min.js"></script>
	<script
		src="/webjars/datatables-buttons/2.3.3/js/buttons.bootstrap5.min.js"></script>
	<script
		src="/webjars/datatables-buttons/2.3.3/js/dataTables.buttons.min.js"></script>
</body>
</html>