*** Settings ***
Resource         ../pages/loginPage.resource
Resource         ../pages/logoutPage.resource
Suite Setup      Open Website
Suite Teardown    Close Website
Test Setup       Log    Début du test
Test Teardown    Log    Fin du test

*** Test Cases ***
Test Connexion et Déconnexion
    [Documentation]    Vérifie connexion puis déconnexion utilisateur
    [Timeout]    20s
    Log In
    Wait Until Page Contains    Dashboard    10s
    Log Out



Test Connexion Invalide
    [Documentation]    Vérifie qu'un login incorrect échoue
    [Timeout]    20s
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    userfail
    Input Text    name=password    passwordfail
    Login Click
    Wait Until Page Contains    Invalid credentials    10s
