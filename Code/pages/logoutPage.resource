*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
User Menu Click
    [Documentation]    Clique sur le menu utilisateur    
    Wait Until Element Is Visible    xpath=//p[@class='oxd-userdropdown-name']    10s
    Click Element    xpath=//p[@class='oxd-userdropdown-name']

Logout Click
    [Documentation]    Clique sur le bouton de déconnexion
    Wait Until Element Is Visible    xpath=//a[text()='Logout']    10s
    Click Element    xpath=//a[text()='Logout']

Log Out
    [Documentation]    Execute les étapes de déconnexion
    User Menu Click
    Logout Click
    Wait Until Page Contains Element    xpath=//input[@name='username']    10s