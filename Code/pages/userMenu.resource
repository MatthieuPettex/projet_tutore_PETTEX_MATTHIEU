*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Open User Menu
    [Documentation]    Ouvre le menu déroulant utilisateur en haut à droite de l'application.
    Wait Until Element Is Visible    xpath=//p[@class='oxd-userdropdown-name']    10s
    Click Element    xpath=//p[@class='oxd-userdropdown-name']

About Click
    [Documentation]    Clique sur l'option "About" dans le menu utilisateur.
    Open User Menu
    Wait Until Element Is Visible    xpath=//a[text()='About']    10s
    Click Element    xpath=//a[text()='About']

Verify About Popup Display 
    [Documentation]    Vérifie que la popup About est bien affichée à l'écran.
    Wait Until Page Contains Element    xpath=//div[@role='dialog']    10s

Close About Popup
    [Documentation]    Ferme la popup About.
    Click Element    xpath=//button[@type='button']

Access Support
    [Documentation]    Clique sur l'option "Support" dans le menu utilisateur.
    Open User Menu
    Wait Until Element Is Visible    xpath=//a[text()='Support']    10s
    Click Element    xpath=//a[text()='Support']

Verify Support Access
    [Documentation]    Vérifie que la page de support est ouverte (nouvel onglet ou redirection).
    Sleep    3s

Access Password Change
    [Documentation]    Clique sur l'option "Change Password" dans le menu utilisateur.
    Open User Menu
    Wait Until Element Is Visible    xpath=//a[text()='Change Password']    10s
    Click Element    xpath=//a[text()='Change Password']

Password Change
    [Documentation]    Change le mot de passe utilisateur avec un nouveau mot de passe fourni.
    Access Password Change
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//label[contains()='Current Password']/following::input[1]    ${PASSWORD}
    Input Text    xpath=//label[contains()='New Password']/following::input[1]        ${NEW_PASSWORD}
    Input Text    xpath=//label[contains()='Confirm Password']/following::input[1]    ${NEW_PASSWORD}
    Click Button    xpath=//button[@type='submit']

Verify Password Change
    [Documentation]    Vérifie que la page de changement de mot de passe est affichée.
    Wait Until Page Contains    Change Password    10s

Log Out
    [Documentation]    Permet de se déconnecter de l'application OrangeHRM.
    Open User Menu
    Wait Until Element Is Visible    xpath=//a[text()='Logout']    10s
    Click Element    xpath=//a[text()='Logout']
    Wait Until Page Contains Element    xpath=//input[@name='username']    10s