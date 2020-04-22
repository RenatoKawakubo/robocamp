*** Settings ***
Documentation       Login
...     Sendo um administrador de catálogo
...     Quero me autenticar no sistema
...     Para que eu possa gerenciar o catálogo de produtos

Library     SeleniumLibrary

# Lego (peças e vc usa a criativade para montar o que vc quiser)

*** Variables ***
${email}            papito@ninjapixel.com
${pass}             pwd123
${pass_error}       1111

*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais 
    Entao devo ser autenticado

Senha incorreta
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais com senha incorreta 
    Entao devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

*** Keywords ***
Dado que eu acesso a página de login
    Open Browser    http://pixel-web:3000/login     chrome
    Maximize Browser Window

Quando eu submeto minhas credenciais
    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Sleep           5
    Click Element   xpath://button[contains(.,'Entrar')]
 
Entao devo ser autenticado
    Wait Until Page Contains    Papito
    Close Browser

Quando eu submeto minhas credenciais com senha incorreta 
    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass_error}
    Click Element   class:btn

Entao devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"
    Wait Until Page Contains    Usuário e/ou senha inválidos
    Close Browser