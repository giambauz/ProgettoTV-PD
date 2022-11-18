<%@page import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Docente"%>
<div class="modal fade" id="createCorsoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						<i class="fas fa-user prefix grey-text"></i> 
						<label data-error="wrong" data-success="right" for="nomeCorso">Nomecorso</label>
						<input type="text" id="nomeCorso" name="nomeCorso" class="form-control validate">
						<div id="infoNomeCorso"></div>
					</div>

					<div class="form-group mb-5">
						<i class="fas fa-user prefix grey-date"></i> 
						<label data-error="wrong" data-success="right" for="dataInizioCorso">Data inizio corso</label>
						<input type="date"id="dataInizioCorso" name="dataInizioCorso"class="form-control validate"> 
						<div id="infoDataInizioCorso"></div>
					</div>

					<div class="form-group mb-5">
						<i class="fas fa-user prefix grey-date"></i> 
						<label data-error="wrong" data-success="right" for="dataFineCorso">Data fine corso</label>
						<input type="date" id="dataFineCorso" name="dataFineCorso"class="form-control validate">
						<div id="infoDataFineCorso"></div>
					</div>
				

					<div class="form-group mb-5">
						<i class="fas fa-envelope prefix grey-number"></i> 
						<label data-error="wrong" data-success="right" for="costoCorso">Costo corso</label>
						<input type="number" id="costoCorso" name="costoCorso" class="form-control validate">
						<div id="infoCostoCorso"></div>
					</div>

					<div class="form-group mb-5">
						<i class="fas fa-envelope prefix grey-text"></i>
						<label data-error="wrong" data-success="right" for="commentiCorso">Commenti corso</label>
						<textarea rows="3" cols="70" id="commentiCorso" name="commentiCorso" style="resize: none" class="form-control validate"></textarea>
						<div id="infoCommentiCorso"></div>
					</div>

					<div class="form-group mb-5">
						<i class="fas fa-envelope prefix grey-text"></i> 
						<label data-error="wrong" data-success="right" for="aulaCorso">Aula corso</label>
						<input type="text" id="aulaCorso" name="aulaCorso" class="form-control validate"> 
						<div id="infoAulaCorso"></div>
					</div>

					<div class="form-group mb-5">
						<i class="fas fa-envelope prefix grey-text"></i> 
						<label data-error="wrong" data-success="right" for="codDocente">Docente</label>
						<select id="codDocente" name="codDocente" class="form-control validate">
							<%
								Docente[] docenti = AmministratoreFacade.getInstance().getAllDocente();
								for (Docente d : docenti) {
							%>
							<option value="<%=d.getCodDocente()%>"><%=d.getNomeDocente() + "&nbsp;" + d.getCognomeDocente()%></option>
							<%
								}
							%>
						</select> 
						<div id="infoCodDocente"></div>
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