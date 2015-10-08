# Pesquisa-Operacional -> Simplex

Projeto de Pesquisa Operacional

Professor Ricardo José Sabatini

Implementação do algoritmo Simplex em Ruby on Rails

Alunos:
* Claudio Roberto Costa - [github.com/claudiocosta](https://github.com/claudiocosta)
* Cristiano Vicente - [github.com/CristSky](https://github.com/CristSky)
* Vitoria Mendes Lopes - [github.com/vimendes](https://github.com/vimendes)

###Documentação

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
