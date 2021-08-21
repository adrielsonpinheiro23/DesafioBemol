*** Settings ***
Library       SeleniumLibrary
Library       FakerLibrary
Library       String

*** Variables ***
${BROWSER}    chrome
${URL}        https://buscacepinter.correios.com.br/app/endereco/index.php
${TIME}       10


*** Keywords ***
### Setup e TEARDOWN
Abrir Navegador
    Open Browser  about:blank  ${BROWSER}

Fechar Navegador
      Close Browser

Acessar a página home do site
      Go To    ${URL}
      Title Should be   Busca CEP

Digitar o CEP "${CEP}" no campo de Pesquisa
      Input Text   css=#endereco    ${CEP}

Digitar na Pesquisa "${BEMOL}"
      Input Text   css=#endereco    ${BEMOL}

Clicar no botão Buscar
      Click Element   xpath=//*[@id="btn_pesquisar"]

Conferir se o CEP "${CEP}" foi realmente pesquisado
      Set Selenium Implicit Wait    ${TIME}
      Wait Until Element Is Visible    css=#mensagem-resultado > h4
      Title Should be                  Busca CEP
      Element Text Should Be           xpath=//*[@id="resultado-DNEC"]/tbody/tr/td[4][contains(text(), "69005-040")]   ${CEP}

Conferir se "${BEMOL}" foi realmente pesquisado
      Set Selenium Implicit Wait    ${TIME}
      Wait Until Element Is Visible    css=#mensagem-resultado > h4
      Title Should be                  Busca CEP
      Click Element                    xpath=//*[@id="resultado-DNEC"]/tbody/tr/td[1]/a
      Element Text Should Be           xpath=//*[@id="detalhes-cep-grande-usuario"][contains(text(), "Lojas Bemol")]   ${BEMOL}
