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
			<h5>Petunjuk</h5>
			<p>Untuk menambah konsumen, anda dapat klik tombol "Tambah
				Konsumen", untuk hapus dan edit dapat klik tombol aksi di paling
				kanan.</p>
		</div>
		<div class="modal fade" id="konsumenModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="konsumenModalLabel">Tambah
							Konsumen</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form action="/konsumen/add" method="POST">
						<div class="modal-body">
							<div class="form-floating mb-3">
								<input class="form-control" name="nama" id="nama" type="text"
									placeholder="Nama" data-sb-validations="required" /> <label
									for="nama">Nama</label>
								<div class="invalid-feedback" data-sb-feedback="nama:required">Nama
									is required.</div>
							</div>
							<div class="form-floating mb-3">
								<textarea class="form-control" name="alamat" id="alamat"
									placeholder="Alamat" style="height: 10rem;"
									data-sb-validations="required"></textarea>
								<label for="alamat">Alamat</label>
								<div class="invalid-feedback" data-sb-feedback="alamat:required">Alamat
									is required.</div>
							</div>
							<div class="form-floating mb-3">
								<input class="form-control" name="kota" id="kota" type="text"
									placeholder="Kota" data-sb-validations="required" /> <label
									for="kota">Kota</label>
								<div class="invalid-feedback" data-sb-feedback="kota:required">Kota
									is required.</div>
							</div>
							<div class="form-floating mb-3">
								<input class="form-control" name="provinsi" id="provinsi"
									type="text" placeholder="Provinsi"
									data-sb-validations="required" /> <label for="provinsi">Provinsi</label>
								<div class="invalid-feedback"
									data-sb-feedback="provinsi:required">Provinsi is
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
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<table border="1" data-component="datatable" id="konsumenData"
					data-locale="en" class="table table-stripped table-bordered">
					<thead>
						<tr>
							<th>Nama</th>
							<th>Alamat</th>
							<th>Kota</th>
							<th>Provinsi</th>
							<th>Tgl Registrasi</th>
							<th>Status</th>
							<th width="10%">Aksi</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>

		</div>
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

	<script>
		var table;
		var options;
		$(document).ready(function() {
			options = {
				dom : '<"container-fluid"<"row"<"col"B><"col"l><"col"f>>>rtip',
				buttons : [ {
					text : 'Tambah Konsumen',
					action : function(e, dt, node, config) {
						$('#konsumenModal').modal('show');
					},
					className : 'btn btn-primary'
				} ],
				sAjaxSource : "/konsumen/all",
				sAjaxDataProp : "",
				order : [ [ 0, "asc" ] ],
				aoColumns : [ {
					"mData" : "id"
				}, {
					"mData" : "alamat"
				}, {
					"mData" : "kota"
				}, {
					"mData" : "provinsi"
				}, {
					"data" : "tglRegistrasi",
					"render": function(data, type, row) {
						var time = row.tglRegistrasi;
						var dateFormat = new Date(time);
						return dateFormat.toLocaleDateString('id-ID');
					}
				}, {
					"mData" : "status"
				}, {
					"data" : "aksi",
					"render" : function(data, type, row) {
						var urlDelete = "/konsumen/delete?id=" + row.id;
						var linkDelete = document.createElement('a');
						linkDelete.className="btn btn-danger"
						linkDelete.innerHTML = `<i class="fa fa-trash"></i>`;
						linkDelete.href = urlDelete;
						
						var urlEdit = "/konsumen/edit?id=" + row.id;
						var linkEdit = document.createElement('a');
						linkEdit.className="btn btn-info";
						linkEdit.innerHTML = `<i class="fa fa-pencil"></i>`;
						linkEdit.href = urlEdit;
						return linkDelete.outerHTML + linkEdit.outerHTML;
					}
				} ]
			};
			table = $('#konsumenData').DataTable(options);
		});
	</script>
</body>
</html>