$(document).ready(function() {
	let noNumeriMax30Validators = {
		notEmpty: {
			message: 'Il campo non pu&ograve; essere vuoto'
		},
		stringLength: {
			message: 'Massimo 30 caratteri',
			max: 30
		},
		regexp: {
			regexp: /^[^0-9]+$/,
			message: 'Il campo non pu&ograve; contenere numeri'
		}
	};
	let commentiValidators = {
		stringLength: {
			message: 'Commenti deve avere al massimo 200 caratteri',
			max: 200
		}
	};
	let aulaValidators = {
		notEmpty: {
			message: 'Il campo non pu&ograve; essere vuoto'
		},
		stringLength: {
			message: 'Massimo 30 caratteri',
			max: 30
		},
		regexp: {
			regexp: /^[a-zA-Z0-9]+$/,
			message: 'Aula corso deve contenere solo Numeri e Lettere'
		}
	};
	let selectOneValidators = {
		notEmpty: {
			message: 'Devi selezionare un\'opzione dalla lista'
		}
	};
	let dataInizioValidators = {
		notEmpty: {
			message: 'Il campo Data inizio non pu&ograve; essere vuoto'
		},
		date: {
			format: 'DD/MM/YYYY',
			message: 'Data non valida, Formato DD/MM/YYYY'
		},
		callback: {
			callback: function(value, validator) {
				let $dataFineCorso = validator.getFieldElements('dataFineCorso')[0].value;
				let dataInizioCorso = new Date(value);
				let dataFineCorso = new Date($dataFineCorso);
				let diffInGiorni = Number.parseInt(dataFineCorso.getTime() - dataInizioCorso.getTime()) / (60 * 60 * 24 * 1000);
				return (diffInGiorni > 1);
			},
			message: 'La durata del corso deve essere di almeno 2 giorni'
		}
	};
	let dataFineValidators = {
		notEmpty: {
			message: 'Il campo Data non pu&ograve; essere vuoto'
		},
		date: {
			format: 'DD/MM/YYYY',
			message: 'Data non valida, Formato DD/MM/YYYY'
		},
		callback: {
			callback: function(value, validator) {
				let $dataInizioCorso = validator.getFieldElements('dataInizioCorso')[0].value;
				let dataInizioCorso = new Date($dataInizioCorso);
				let dataFineCorso = new Date(value);
				let diffInGiorni = Number.parseInt(dataFineCorso.getTime() - dataInizioCorso.getTime()) / (60 * 60 * 24 * 1000);
				return (diffInGiorni > 1);
			},
			message: 'La durata del corso deve essere di almeno 2 giorni'
		}
	};
	let corsoValidatorOptions = {
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			nomeCorso: {
				container: '#infoNomeCorso',
				validators: noNumeriMax30Validators
			},
			dataInizioCorso: {
				container: '#infoDataInizioCorso',
				validators: dataInizioValidators
			},
			dataFineCorso: {
				container: '#infoDataFineCorso',
				validators: dataFineValidators
			},
			costoCorso: {
				container: '#infoCostoCorso',
				validators: {
					notEmpty: {
						message: 'Il campo Costo non pu&ograve; essere vuoto'
					}
				}
			},
			commentiCorso: {
				container: '#infoCommentiCorso',
				validators: commentiValidators
			},
			aulaCorso: {
				container: '#infoAulaCorso',
				validators: aulaValidators
			},
			codDocente: {
				container: '#infoCodDocente',
				validators: selectOneValidators
			}
		}
	};
	$('#corsoForm').bootstrapValidator(corsoValidatorOptions);
	let corsistaValidatorOptions = {
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			nomeCorsista: {
				container: '#infoNomeCorsista',
				validators: noNumeriMax30Validators
			},
			cognomeCorsista: {
				container: '#infoCognomeCorsista',
				validators: noNumeriMax30Validators
			},
			codCorso: {
				container: '#infoDocente',
				validators: selectOneValidators
			}
		}
	};
	$('#corsistaForm').bootstrapValidator(corsistaValidatorOptions);
})