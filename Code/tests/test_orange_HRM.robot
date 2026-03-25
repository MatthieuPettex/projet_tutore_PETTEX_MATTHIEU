*** Settings ***
Resource         ../pages/loginPage.resource
Resource         ../pages/userMenu.resource
Resource         ../pages/upgradePage.resource

Suite Setup      Open Website
Suite Teardown    Close Website
Test Setup       Log    Début du test
Test Teardown    Log    Fin du test

*** Test Cases ***
Test Reconnexion Avec Nouveau Mot De Passe Echoue
    [Documentation]    Vérifie que la reconnexion avec le nouveau mot de passe échoue (comportement attendu du site de démo)

    # Connexion initiale
    Log In
    Wait Until Page Contains    Dashboard    10s

    # Tests des différentes pages liées au menu utilisateur
    About Click
    Verify About Popup Display 
    Close About Popup

    Access Support
    Verify Support Access
    # Changement du mot de passe
    Password Change

    # Déconnexion
    Log Out

    # Tentative de reconnexion avec le nouveau mot de passe
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${NEW_PASSWORD}
    Click Button    xpath=//button[@type='submit']

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
    [Documentation]    Test de la foncionnalité upgrade du site.
    Log In
    Upgrade Page Access
    Fill Form
    Submit Form
    Verify Submit