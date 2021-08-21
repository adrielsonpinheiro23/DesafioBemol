*** Settings ***
Library       SeleniumLibrary
Library       FakerLibrary
Library       String

*** Variables ***
${BROWSER}    chrome
${URL}        http://www.trivago.com.br/
${TIME}       10


*** Keywords ***
### Setup e TEARDOWN
Abrir Navegador
    Open Browser  about:blank  ${BROWSER}

Fechar Navegador
    Close Browser

Acessar a página home do site
      Go To    ${URL}
      Set Selenium Implicit Wait    ${TIME}
      #Wait Until Element Is Visible   css=#js_navigation > a

Digitar o valor "${CIDADE}" no campo de pesquisa
      Input Text   css=#querytext    ${CIDADE}

Clicar no botão Pesquisar
      Click Element   xpath=//*[@id="suggestion-56507/200"]/div/span[2]
      Set Selenium Implicit Wait    ${TIME}
      #Double CLick Element  css=#js-homepage-title > h1
      Click Element   xpath=//*[@id="js-fullscreen-hero"]/div[1]/div[2]/form/div/div[4]/div[1]/button/span[1]
      Wait Until Element Is Visible   xpath=//*[@id="onetrust-banner-sdk"]/div/div[1]
      Set Selenium Implicit Wait    ${TIME}
      Set Selenium Implicit Wait    ${TIME}
      Double CLick Element  css=#js-homepage-title > h1
      Click Element   xpath=//*[@id="onetrust-accept-btn-handler"]
      Set Selenium Implicit Wait    ${TIME}
      Click Element  xpath=//*[@id="onetrust-accept-btn-handler"]
      Double CLick Element  css=#js-homepage-title > h1
      Set Selenium Implicit Wait    ${TIME}
      Click Element   xpath=//*[@id="js-fullscreen-hero"]/div[1]/div[2]/form/div/button[2]/span[2]

Selecionar a opção ordenar por "Avaliação e Sugestões"
      Set Selenium Implicit Wait    ${TIME}
      Wait Until Element Is Visible   xpath=//*[@id="1476461"]/div/article/div[1]/div[1]/div[2]/div/img
      Click Element   xpath=//*[@id="mf-select-sortby"]
      Select From List By Value    xpath=//*[@id="mf-select-sortby"]    7
      Set Selenium Implicit Wait    ${TIME}
      Set Selenium Implicit Wait    ${TIME}
      Wait Until Element Is Visible   xpath=//*[@id="1476461"]/div/article/div[1]/div[1]/div[2]/div/img

Realizar Conferência de Nome
      Page Should Contain Image            xpath=//*[@id="1476461"]/div/article/div[1]/div[1]/div[2]/div/img[@src="//imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/14/76/1476461_v1.jpeg"]
      Page Should Contain Element          xpath=//*[@id="1476461"]/div/article/div[1]/div[2]/div/div/h3/span
      Page Should Contain Element          xpath=//*[@id="1476461"]/div/article/div[1]/div[2]/div/div/h3/span[@title="Holiday Inn Manaus"]
      Log To Console    "Holiday Inn Manaus"

Realizar Conferência de Avaliação
      Page Should Contain Element          xpath=//*[@id="1476461"]/div/article/div[1]/div[2]/div/div/button/span[1]/span[1]/span
      Page Should Contain Element          xpath=//*[@id="1476461"]/div/article/div[1]/div[2]/div/div/button/span[1]/span[2]/strong
      Log To Console    Excelente|8.5

Realizar Conferência de Valor
    #  Page Should Contain Element          css=#\31 476461 > div > article > div.pos-relative.item__wrapper > div.item__flex-column > section > div > article > div.accommodation-list__recommended--3b409.js_co_link > div.accommodation-list__dealInfo--f1b19.accommodation-list__offset--92f3c > div > div > div > strong
      Page Should Contain Element          xpath=//*[@id="1476461"]/div/article/div[1]/div[2]/section/div/article/div[1]/div[2]/div/div/div/strong
      Log To Console    R$214,00
