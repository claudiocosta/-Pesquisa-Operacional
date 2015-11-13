function valida() {
    var variaveis = $('#input1');
    var restricoes = $('#input2');
    var btn = $('#btn-valida');
    if ((variaveis.val() != "") && (restricoes.val() != "")) {
        if (variaveis.val() < 1) {
            alert('A quantidade das variáveis tem que ser maior que zero.');
            variaveis.focus();
        } else {
            if (restricoes.val() < 1) {
                alert('A quantidade das restrições tem que ser maior que zero.');
                restricoes.focus();
            } else {
                variaveis.attr('readonly', true);
                restricoes.attr('readonly', true);
                btn.attr('disabled', '');
                if (window.location.pathname == "/simplex")
                    montarParteDois((variaveis.val()), (restricoes.val()));
                else if (window.location.pathname == "/knapsack")
                    knapsackForm(restricoes.val());
                $('#parte2').show(400);
            }
        }
    } else {
        alert('Preencha os campos obrigatórios!');
        if (variaveis.val() == "") {
            variaveis.focus();
        } else {
            restricoes.focus();
        }
    }
}

function montarParteDois(qtdVariaveis, qtdRestricoes) {
    var i, j;
    var sa = "";
    var sa_nome = "";
    for (i = 0; i < qtdVariaveis; i++) {
        $('#valname').append('<th style="text-align: center">X' + (i + 1) + '</th>');
        $('#funcao').append('<td style="min-width: 110px"><input type="number" step="any" class="form-control fc-size" name="z[]" size="3" maxlength="2"/></td>');
    }
    for (i = 0; i < qtdRestricoes; i++) {
        sa = "<tr>";
        sa_nome = "<tr>";
        for (j = 0; j < qtdVariaveis; j++) {
            sa_nome += '<th style="text-align: center">X' + (j + 1) + '</th>';
            sa += '<td><input type="number" step="any" class="form-control fc-size" name="sa[' + (i + 1) + '][]" size="3" maxlength="2"/></td>';
        }
        $('#restricoes').append(sa_nome + '<th></th><th style="text-align: center">b</th></tr>')
            .append(sa + '<th>&le;</th><td><input type="number" step="any" class="form-control fc-size" name="b[]" size="3" min="0" maxlength="2"/></td></tr>');
    }
}

function knapsackForm(qtdItens) {
    $('#item').append('<tr><th class="text-center">Itens</th><th class="text-center">Peso</th><th class="text-center">Custo</th></tr>');
    for (i = 1; i <= qtdItens; i++) {
        $('#item').append('<tr><th class="fci-size text-center">' + i + '</th>' +
        '<td><input type="number" step="any" class="form-control fc-size" name="w[]" size="3" min="0" /></td>' +
        '<td><input type="number" step="any" class="form-control fc-size" name="c[]" size="3" min="0" /></td></tr>');
    }
}