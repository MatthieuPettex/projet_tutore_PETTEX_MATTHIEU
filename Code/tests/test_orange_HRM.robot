*** Settings ***
Resource         ../pages/loginPage.resource
Suite Setup      Open Website
Suite Teardown    Close Website
Test Setup       Log    Début du test
Test Teardown    Log    Fin du test

*** Test Cases ***
Test Connexion Valide
    [Documentation]    Vérifie que l'utilisateur peut se connecter avec des identifiants valides
    Log In
    Wait Until Page Contains    Dashboard    10s
    Close Website

Test Connexion Invalide
    [Documentation]    Vérifie qu'un login incorrect échoue
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    userfail
    Input Text    name=password    passwordfail
    Login Click
    Wait Until Page Contains    Invalid credentials    10s
