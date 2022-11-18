<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corso"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corsista"%>
<%@page
	import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%@page
	import="com.betacom.trevisopadova.businesscomponent.model.Docente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<div class="modal fade" id="createCorsoCorsistaModal" role="dialog">
	<div class="modal-dialog" role="document">
	
		<form action="aggiungiCorsoCorsista" method="post" id="corsoCorsistaForm">
			<div class="modal-content">
			
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title">Assegna corsista a corso</h3>
				</div>
				
				<div class="modal-body mx-3">
					<div class="form-group mb-5">
						<label for="codCorso">Corso</label>
						<select id="codCorso" name="codCorso" class="form-control validate">
								<option value="" selected>Scegli un Corso</option>
								<%
								Corso[] corsi = AmministratoreFacade.getInstance().getDisponibiliCorso();
								for (Corso c : corsi) {
								%>
								<option value="<%=c.getCodCorso()%>"><%=c.getNomeCorso()%></option>
								<%
								}
								%>
	
						</select>
						<div id="infoccCodCorso"></div>
					</div>
					<div class="form-group mb-5">
						<label for="codCorsista">Corsista</label>
						<select
							id="codCorsista" name="codCorsista" class="form-control">
							<option value="" selected>Scegli un Corsista</option>
							<%
							Corsista[] corsisti = AmministratoreFacade.getInstance().getAllCorsista();
							for (Corsista c : corsisti) {
							%>
							<option value="<%=c.getCodCorsista()%>"><%=c.getNomeCorsista() + "&nbsp;" + c.getCognomeCorsista()%></option>
							<%
							}
							%>

						</select>
						<div id="infoccCodCorsista"></div>
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