<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<div class="modal fade" id="createCorsistaModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	
		<form action="aggiungiCorso" method="post" id="corsoForm">
			<div class="modal-content">
			
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					
					<h3 class="modal-title">
						Inserisci Corsista
					</h3>
				</div>
				
				<div class="modal-body mx-3">
					<div class="md-form mb-5">
						<label for="nomeCorsista">Nome corsista</label>
						<input type="text" id="nomeCorsista" class="form-control">
					</div>

					<div class="md-form mb-5"> 
						<label for="cognomeCorsista">Cognome corsista</label>
						<input type="text" id="cognomeCorsista" class="form-control">
					</div>

					<div class="md-form precedenti-formativi-lt">
						<label for="precedentiFormativi">Precedenti formativi</label>
						<input type="checkbox" id="precedentiFormativi" class="form-control"> 
					</div>
				</div>
				
				<div class="modal-footer d-flex justify-content-center">
					<input type="submit" class="btn btn-success" value="Aggiungi">
					<input type="reset" class="btn btn-warning" value="Reset">
				</div>
			</div>
		</form>
	</div>
</div>