<%@page
	import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%@page
	import="com.betacom.trevisopadova.businesscomponent.model.Docente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<div class="modal fade" id="createCorsoModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<form action="aggiungiCorso" method="post" id="corsoForm">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title w-100 font-weight-bold">Inserisci Corso</h4>
				</div>
				<div class="modal-body mx-3">
					<div class="form-group mb-5">
						<i class="fas fa-user prefix grey-text"></i> <input type="text"
							id="nomeCorso" name="nomeCorso" class="form-control validate">
						<label data-error="wrong" data-success="right" for="nomeCorso">Nome
							corso</label>
						<div id="infoNomeCorso"></div>
					</div>
					<br>

					<div class="form-group mb-5">
						<i class="fas fa-user prefix grey-date"></i> <input type="date"
							id="dataInizioCorso" name="dataInizioCorso"
							class="form-control validate"> <label data-error="wrong"
							data-success="right" for="dataInizioCorso">Data inizio
							corso</label>
						<div id="infoDataInizioCorso"></div>
					</div>
					<br>

					<div class="form-group mb-5">
						<i class="fas fa-user prefix grey-date"></i> <input type="date"
							id="dataFineCorso" name="dataFineCorso"
							class="form-control validate"> <label data-error="wrong"
							data-success="right" for="dataFineCorso">Data fine corso</label>
						<div id="infoDataFineCorso"></div>
					</div>
					<br>

					<div class="form-group mb-5">
						<i class="fas fa-envelope prefix grey-number"></i> <input
							type="number" id="costoCorso" name="costoCorso"
							class="form-control validate"> <label data-error="wrong"
							data-success="right" for="costoCorso">Costo corso</label>
						<div id="infoCostoCorso"></div>
					</div>
					<br>

					<div class="form-group mb-5">
						<i class="fas fa-envelope prefix grey-text"></i>
						<textarea rows="3" cols="70" id="commentiCorso"
							name="commentiCorso" style="resize: none"
							class="form-control validate"></textarea>
						<label data-error="wrong" data-success="right" for="commentiCorso">Commenti
							corso</label>
						<div id="infoCommentiCorso"></div>
					</div>
					<br>

					<div class="form-group mb-5">
						<i class="fas fa-envelope prefix grey-text"></i> <input
							type="text" id="aulaCorso" name="aulaCorso"
							class="form-control validate"> <label data-error="wrong"
							data-success="right" for="aulaCorso">Aula corso</label>
						<div id="infoAulaCorso"></div>
					</div>
					<br>

					<div class="form-group mb-5">
						<i class="fas fa-envelope prefix grey-text"></i> <select
							id="codDocente" name="codDocente" class="form-control validate">
							<option value="" selected>Scegli un Docente</option>
							<%
							Docente[] docenti = AmministratoreFacade.getInstance().getAllDocente();
							for (Docente d : docenti) {
							%>
							<option value="<%=d.getCodDocente()%>"><%=d.getNomeDocente() + "&nbsp;" + d.getCognomeDocente()%></option>
							<%
							}
							%>

						</select> <label data-error="wrong" data-success="right" for="codDocente">Docente</label>
						<div id="infoCodDocente"></div>
					</div>
					<br>

				</div>
				<div class="modal-footer d-flex justify-content-center">
					<input type="submit" class="btn btn-primary" value="Aggiungi">
				</div>

			</div>
		</form>
	</div>
</div>