*** Settings ***
Resource    ../pages/loginPage.resource
Resource    ../pages/userMenu.resource
Resource    ../pages/upgradePage.resource
Resource    ../pages/recruitmentPage.resource
Resource    ../pages/myinfoPage.resource

Suite Setup      Open Website
Suite Teardown    Close Website
Test Setup       Log    Début du test
Test Teardown    Log    Fin du test

*** Test Cases ***
Test TC01 Connexion Valide
    [Documentation]    Identifiants valides
    Log In
    
Test TC02 Connexion Invalide
    [Documentation]    Vérifie qu'un login incorrect échoue
    [Timeout]    20s
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    userfail
    Input Text    name=password    passwordfail
    Login Click
    Wait Until Page Contains    Invalid credentials    10s

Test TC03 Deconnexion
    [Documentation]    Vérifie la fonction de déconnexion via le menu utilisateur
    Log In
    Log Out

Test TC04 About
    [Documentation]    Verifie le bon fonctionnement de l'option About dans le menu utilisateur
    Log In
    About Click
    Verify About Popup Display
    Close About Popup

Test TC05 Support
    [Documentation]    Verifie le bon fonctionnement de l'option Support dans le menu utilisateur
    Log In
    Access Support
    Verify Support Access 

Test TC06 E2E Reconnexion Avec Nouveau Mot De Passe (Anomalie)
    [Documentation]    Vérifie que la reconnexion avec le nouveau mot de passe échoue et test les fonctionnalités du menu utilisateur
    Log In
    Wait Until Page Contains    Dashboard    10s
    #User Menu Full
    Password Change
    Log Out
    # Tentative de reconnexion avec le nouveau mot de passe
    New Log In
    # Vérification de l'échec
    Wait Until Page Contains    Invalid credentials    10s

Test Upgrade
    [Documentation]    Test de la fonctionnalité upgrade du site.
    Log In
    Upgrade Page Access
    Fill Form
    Submit Form
    Verify Submit

Test TC07 E2E Recruitment
    [Documentation]    E2E sur les fonctionnalités liées au recrutement de candidat.
    Log In
    Load Candidate Data
    Add Candidate
    See Candidate
    Delete Candidate
    Log Out

Test TC08 E2E Myinfo
    [Documentation]    test de la fonctionnalité de modification des infos utilisateur
    Log In
    Load Myinfo Data
    Fill Myinfo Form
    Log Out
