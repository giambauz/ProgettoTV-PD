<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserisci Corso vs Corsista</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Inserisci Corsista</h2>
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">Inserisci Corsista</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h4 class="modal-title w-100 font-weight-bold">Inserisci
							Corsista</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body mx-3">
						<div class="md-form mb-5">
							<i class="fas fa-user prefix grey-text"></i> <input type="text"
								id="orangeForm-name" class="form-control validate"> <label
								data-error="wrong" data-success="right" for="orangeForm-name">Nome
								corsista</label>
						</div>
						<br>
						<div class="md-form mb-5">
							<i class="fas fa-envelope prefix grey-text"></i> <input
								type="text" id="orangeForm-name" class="form-control validate">
							<label data-error="wrong" data-success="right"
								for="orangeForm-name">Cognome corsista</label>
						</div>
						<br>


						<div class="md-form mb-5">
							<i class="fas fa-envelope prefix grey-text"></i> <input
								type="checkbox" id="orangeForm-checkbox"
								class="form-control validate"> <label data-error="wrong"
								data-success="right" for="orangeForm-checkbox">Precedenti
								formativi</label>
						</div>
						<br>

					</div>
					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-deep-orange">Aggiungi</button>
					</div>
				</div>
			</div>
		</div>

		<h2>Inserisci Corso</h2>
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal2">Inserisci Corso</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h4 class="modal-title w-100 font-weight-bold">Inserisci
							Corso</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body mx-3">
						<div class="md-form mb-5">
							<i class="fas fa-user prefix grey-text"></i> <input type="text"
								id="orangeForm-name" class="form-control validate"> <label
								data-error="wrong" data-success="right" for="orangeForm-name">Nome
								corso</label>
						</div>
						<br>
						<div class="md-form mb-5">
							<i class="fas fa-user prefix grey-date"></i> <input type="date"
								id="orangeForm-date" class="form-control validate"> <label
								data-error="wrong" data-success="right" for="orangeForm-date">Data
								inizio corso</label>
						</div>
						<br>
						<div class="md-form mb-5">
							<i class="fas fa-user prefix grey-date"></i> <input type="date"
								id="orangeForm-date" class="form-control validate"> <label
								data-error="wrong" data-success="right" for="orangeForm-date">Data
								fine corso</label>
						</div>
						<br>

						<div class="md-form mb-5">
							<i class="fas fa-envelope prefix grey-number"></i> <input
								type="number" id="orangeForm-number"
								class="form-control validate"> <label data-error="wrong"
								data-success="right" for="orangeForm-number">Costo corso</label>
						</div>
						<br>
						<div class="md-form mb-5">
							<i class="fas fa-envelope prefix grey-text"></i> <input
								type="text" id="orangeForm-name" class="form-control validate">
							<label data-error="wrong" data-success="right"
								for="orangeForm-name">Commenti corso</label>
						</div>
						<br>
						<div class="md-form mb-5">
							<i class="fas fa-envelope prefix grey-text"></i> <input
								type="text" id="orangeForm-name" class="form-control validate">
							<label data-error="wrong" data-success="right"
								for="orangeForm-name">Aula corso</label>
						</div>
						<br>
						<div class="md-form mb-5">
							<i class="fas fa-envelope prefix grey-text"></i> <input
								type="text" id="orangeForm-name" class="form-control validate">
							<label data-error="wrong" data-success="right"
								for="orangeForm-name">Docente</label>
						</div>
						<br>
					</div>
					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-deep-orange">Aggiungi</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>