*** Settings ***
Resource          ResourceWeb1.robot
Suite Setup       Abrir Navegador
#Suite Teardown  Fechar Navegador


*** Test Case ***
Caso de teste A: Pesquisar CEP Existente
         Acessar a página home do site
         Digitar o CEP "69005-040" no campo de Pesquisa
         Clicar no botão Buscar
         Conferir se o CEP "69005-040" foi realmente pesquisado
         #[Teardown]  Fechar Navegador

Caso de teste B: Pesquisar por Lojas Bemol
          Acessar a página home do site
          Digitar na Pesquisa "Lojas Bemol"
          Clicar no botão Buscar
          Conferir se "Lojas Bemol" foi realmente pesquisado
          #[Teardown]  Fechar Navegador
