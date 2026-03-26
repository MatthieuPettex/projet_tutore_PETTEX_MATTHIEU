*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Resource    ../pages/userMenu.resource

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${NEW_PASSWORD}    admin456

${CURRENT_PASSWORD_FIELD}    xpath=//label[text()='Current Password']/following::input[1]
${NEW_PASSWORD_FIELD}        xpath=//label[text()='New Password']/following::input[1]
${CONFIRM_PASSWORD_FIELD}    xpath=//label[text()='Confirm Password']/following::input[1]

*** Keywords ***
Open Website
    [Documentation]    Ouvre le navigateur et se rend sur le site OrangeHRM puis met la fenêtre en grand
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Load User Data
    [Documentation]    Charge les données utilisateurs depuis users.json
    ${json}=    Load Json From File    ${CURDIR}/../data/users.json
    ${username}=    Get Value From Json    ${json}    $.username
    ${password}=    Get Value From Json    ${json}    $.password
    Set Suite Variable    ${USERNAME}    ${username[0]}
    Set Suite Variable    ${PASSWORD}    ${password[0]}

Username Input
    [Documentation]    Insere le nom d'utilisateur dans le champ de connexion
    Input Text    name=username    ${USERNAME}

Password Input
    [Documentation]    Insere le mot de passe dans le champ de connexion
    Input Text    name=password    ${PASSWORD}

Login Click
    [Documentation]    Clique sur le bouton pour se connecter
    Click Button    xpath=//button[@type='submit']

Log In
    [Documentation]    Execute les étapes de connexion
    Load User Data
    Wait Until Element Is Visible    name=username    10s
    Username Input
    Password Input
    Login Click

New Log In
    [Documentation]    Tente de se connecter avec le nouveau mot de passe.
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${NEW_PASSWORD}
    Click Button    xpath=//button[@type='submit']
    

Close Website
    [Documentation]    Ferme le site OrangeHRM
    Close Browser