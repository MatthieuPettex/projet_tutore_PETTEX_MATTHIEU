*** Settings ***
Resource         ../pages/loginPage.resource
Resource         ../pages/userMenu.resource
Resource         ../pages/upgradePage.resource
Resource          ../pages/recruitmentPage.resource

Suite Setup      Open Website
Suite Teardown    Close Website
Test Setup       Log    Début du test
Test Teardown    Log    Fin du test

*** Test Cases ***
Test Reconnexion Avec Nouveau Mot De Passe Echoue
    [Documentation]    Vérifie que la reconnexion avec le nouveau mot de passe échoue et test les fonctionnalités du menu utilisateur
    Log In
    Wait Until Page Contains    Dashboard    10s
    User Menu Full
    Password Change
    Log Out
    # Tentative de reconnexion avec le nouveau mot de passe
    New Log In

    # Vérification de l'échec
    Wait Until Page Contains    Invalid credentials    10s

Test Connexion Invalide
    [Documentation]    Vérifie qu'un login incorrect échoue
    [Timeout]    20s
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    userfail
    Input Text    name=password    passwordfail
    Login Click
    Wait Until Page Contains    Invalid credentials    10s

Test Upgrade
    [Documentation]    Test de la fonctionnalité upgrade du site.
    Log In
    Upgrade Page Access
    Fill Form
    Submit Form
    Verify Submit

Test Recruitment
    [Documentation]    E2E sur les fonctionnalités liées au recrutement de candidat.
    Log In
    Load Candidate Data
    Add Candidate
    #See Candidate
    #Delete Candidate
    Log Out