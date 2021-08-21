*** Settings ***
Resource          ResourceWeb2.robot
Suite Setup       Abrir Navegador
#Suite Teardown  Fechar Navegador


*** Test Case ***
Pesquisar no Site
         Acessar a página home do site
         Digitar o valor "Manaus" no campo de pesquisa
         Clicar no botão Pesquisar
         Selecionar a opção ordenar por "Avaliação e Sugestões"
         Realizar Conferência de Nome
         Realizar Conferência de Avaliação
         Realizar Conferência de Valor

         #[Teardown]  Fechar Navegador
