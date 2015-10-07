//$(document).on('ready',function() {
	//$('#quantVariaveis').focus();
//});

function valida() {
	var variaveis = $('#quantVariaveis');
	var restricoes = $('#quantRestricoes');
    var btn = $('#btn-valida');
	if((variaveis.val() != "") && (restricoes.val() != "")) {
		if(variaveis.val() <= 1) {
			alert('A quantidade das variáveis tem que ser maior que um.');
			variaveis.focus();
		} else {
			if(restricoes.val() <= 0) {
				alert('A quantidade das restrições tem que ser maior que zero.');
				restricoes.focus();
			} else {
				variaveis.attr('readonly', true);
				restricoes.attr('readonly', true);
                btn.attr('disabled','');
				montarParteDois((variaveis.val()), (restricoes.val()));
				$('#parte2').show(400);
			}
		}
	} else {
		alert('Preencha os campos obrigatórios!');
		if(variaveis.val() == "") {
			variaveis.focus();
		} else {
			restricoes.focus();
		}
	}
}

function montarParteDois(qtdVariaveis, qtdRestricoes) {
	var i,j;
    var sa = "";
	for (i = 0; i < qtdVariaveis; i++) {
		$('#funcao').append('<input type="number" class="form-control fc-size" name="z[]" size="3" maxlength="2"/> x' + (i+1) + '&emsp;');
	}
	for (i = 0; i < qtdRestricoes; i++) {
        sa = "";
        sa += '<p class="text-center">';
        for(j = 0; j < qtdVariaveis; j++) {
            sa += '<input type="number" class="form-control fc-size" name="sa' + (i + 1) + '[]" size="3" value="0" min="0" maxlength="2"/> x' + (j + 1) + '&emsp;';
        }
        $('#restricoes').append(sa + '</p><br/>');
	}
}
