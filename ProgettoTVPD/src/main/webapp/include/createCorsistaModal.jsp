<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<div class="modal fade" id="createCorsistaModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title w-100 font-weight-bold">Inserisci
					Corsista</h4>
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
					<i class="fas fa-envelope prefix grey-text"></i> <input type="text"
						id="orangeForm-name" class="form-control validate"> <label
						data-error="wrong" data-success="right" for="orangeForm-name">Cognome
						corsista</label>
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