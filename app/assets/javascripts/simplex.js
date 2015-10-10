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
    var sanome = "";
	for (i = 0; i < qtdVariaveis; i++) {
        $('#valname').append('<th style="text-align: center">X'+(i+1)+'</th>');
		$('#funcao').append('<td style="min-width: 110px"><input type="number" step="any" class="form-control fc-size" name="z[]" size="3" maxlength="2"/></td>');
	}
	for (i = 0; i < qtdRestricoes; i++) {
        sa = "<tr>";
        sanome = "<tr>";
        for(j = 0; j < qtdVariaveis; j++) {
            sanome += '<th style="text-align: center">X'+(j+1)+'</th>';
            sa += '<td><input type="number" step="any" class="form-control fc-size" name="sa[' + (i + 1) + '][]" size="3" min="0" maxlength="2"/></td>';
        }//<strong>&le;</strong>&emsp;
        $('#restricoes').append(sanome + '<th></th><th style="text-align: center">b</th></tr>');
        $('#restricoes').append(sa + '<th>&le;</th><td><input type="number" step="any" class="form-control fc-size" name="b[]" size="3"  min="0" maxlength="2"/></td></tr>');
	}
}
