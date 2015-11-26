***
## Nota de liberação: Mochila (Knapsack)

### Introdução
* Este documento provê uma visão geral da versão do aplicativo para solução do problema da Mochila (Knapsack), que está sendo liberada. Aqui descreveremos as funcionalidades do aplicativo, bem como seus problemas e limitações conhecidos. Por último são descritas as demandas e os problemas que foram resolvidos para liberação da versão atual.


1.  **Nota de release a ser publicado**
 * Projeto Knapsack, resolução do problema da Mochila.


2.  **Problemas conhecidos e limitações**
 * Tudo ocorreu bem no processo, não houve nenhum problema ou limitação dentro do escopo definido.


3. **Datas Importantes**
 - Segue abaixo as datas importantes do desenvolvimento:

    | Data | Evento |
| --- | --- |
| 13/11 | Início do planejamento. |
| 13/11 | Início do desenvolvimento |
| 14/11 | Testes |
| 15/11 | Fim do teste |
| 16/11 | Liberação para produção |


4.  **Compatibilidade**

  | Requisitos | Ferramentas |
| --- | --- |
| Navegadores | Mozilla Firefox, Google Chrome e Internet Explorer |
| Sistema operacional | Qualquer sistema com web Browser que suporte HTML5 |

  | | Tecnologias |
| --- | --- |
| Linguagem de programação | Ruby |
| Framework WEB | Ruby on Rails(back-end), Bootstrap 3 (front-end) |
| IDE | RubyMine |
| Design pattern | MVC |
| Servidor Web | Heroku |
 

5. **Procedimento de alteração de configuração do Ambiente**
  * Foi adicionado a conta já existente no servidor Heroku com um domínio gratuito https://disboard.herokuapp.com/
Foi gerado uma secret_key_base, para o modo de produção.
Através de um comando “git push” foi feito o upload dos arquivos da aplicação para o servidor do heroku, o servidor faz a detecção do framework utilizado e roda automaticamente os serviços necessários para o funcionamento da aplicação.


6. **Atividades realizadas no período**
 * Nessa liberação foram contemplados os seguintes itens:

    | Cód | Título | Tarefa | Situação |
| --- | --- | --- | --- |
| 1 | Criação do Front-End | Criação das views (knapsack, result e _form), possibilitando o usuário enviar seus dados para o cálculo e verificar seus resultados. | Concluído |
| 2 | Desenvolvimento do método | Algoritmo Knapsack, que faz o calculo do problema da mochila. | Concluído |
| 3 | Testes gerais | Testes manuais feitos pelos desenvolvedores | Concluído |



***
***


# Pesquisa-Operacional -> Simplex e Knapsnack

Projeto de Pesquisa Operacional

Professor Ricardo José Sabatini

Implementação do algoritmo Simplex em Ruby on Rails

Alunos:
* Claudio Roberto Costa - [github.com/claudiocosta](https://github.com/claudiocosta)
* Cristiano Vicente - [github.com/CristSky](https://github.com/CristSky)
* Vitoria Mendes Lopes - [github.com/vimendes](https://github.com/vimendes)

###Knapsnack (acesse em [https://disboard.herokuapp.com/knapsack](https://disboard.herokuapp.com/knapsack))
1. **O que é o Knapsnack**
  O problema da mochila (em inglês, Knapsack problem) é um problema de optimização combinatória. O nome dá-se devido ao modelo de uma situação em que é necessário preencher uma mochila com objetos de diferentes pesos e valores. O objetivo é que se preencha a mochila com o maior valor possível, não ultrapassando o peso máximo.
2. **Página Inicial**
  * Nossa página inicial mostra o que necessitamos de informações para os cálculos e chegar a um resultado.
  * Precisamos da capacidade máxima e da quantidade de itens. Logo, colocamos o peso e valor para cada item.
3. **Resultado**
  * Clicando no botão "Continuar", veremos a resolução do método.
  

***

###Simplex (acesse em [https://disboard.herokuapp.com/simplex](https://disboard.herokuapp.com/simplex))

* **O que é o Simplex**
* **Página inicial**
* **Resultado**
* **Principais dificuldades até o momento**

1. **O que é o Simplex**
  * Simplex é um algoritmo criado para facilitar a solução de muitos problemas da programação linear. Bastante popular, encontra boa aceitação em áreas onde diversas necessidades e restrições influenciam em um valor que precisa ser aumentado ou diminuído ao máximo, como a questão da maximização de lucros e a utilização máxima da matéria prima numa indústria, por exemplo.
  * Relacionado à programação linear, que trabalha com funções do 1º grau, a ideia do algoritmo é bem simples. Inicialmente, atribui-se valor zero às variáveis, que seria distante da solução. Em seguida, incrementa-se pouco a pouco a variável que tem maior interferência positiva no resultado da função objetivo, ou seja, a que possui o maior coeficiente. Esta é chamada de "variável ativa" e tem grande importância inicial pois é a mais “lucrativa” delas, ou seja, a que mais nos aproxima da otimização.
2. **Página Inicial**
  * Nossa página inicial mostra o que necessitamos de informações para os cálculos e chegar a um resultado, ao menos, parcial.
  * Precisamos da quantidade de variáveis (x1, x2, x3...) e de restrições. Após essa etapa, é o preenchimento da função e de cada restrição.
3. **Resultado**
  * Clicando no botão "Continuar", veremos por padrão a resolução passo a passo do método, mostrando as soluções viáveis possíveis, com a paginação para seguir às próximas soluções.
  * Temos também a opção de visualizar somente a resolução simplificada, com a solução ótima.
4. **Principais dificuldades até o momento**
  * Na verdade, a principal dificuldade não é necessariamente com o projeto, mas um desafio pessoal do grupo a aprender uma nova linguagem e, ao mesmo tempo, implementar algo que nos é relativamente novo na programação.
