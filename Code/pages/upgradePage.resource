*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary

*** Keywords ***

Upgrade Page Access
    [Documentation]    Accède à la page Upgrade depuis l'application.
    Wait Until Element Is Visible    xpath=//a[contains(.,'Upgrade')]    10s
    Click Element    xpath=//a[contains(.,'Upgrade')]

Fill Form
    [Documentation]    Remplit les 7 champs du formulaire Upgrade.
    # Ferme le pop up
    Wait Until Element Is Visible    xpath=//iframe    10s
    Select Frame    xpath=//iframe

    Wait Until Element Is Visible    xpath=//button    10s
    Click Element    xpath=//button

    Unselect Frame

    # Complète en envoie le formulaire
    Wait Until Element Is Visible    xpath=//input[contains(@name,'firstname')]    15s

    Input Text    xpath=//input[contains(@name,'firstname')]    Matthieu
    Input Text    xpath=//input[contains(@name,'lastname')]     Pettex
    Input Text    xpath=//input[contains(@name,'email')]        test@gmail.com
    Input Text    xpath=//input[contains(@name,'phone')]        0700000000
    Input Text    xpath=//input[contains(@name,'company')]      Sogeti
    Input Text    xpath=//input[contains(@name,'jobtitle')]     Ingénieur en test logiciel
    Input Text    xpath=//textarea[contains(@name,'message')]   Test automatisé Robot Framework

Submit Form
    [Documentation]    Soumet le formulaire Upgrade.
    Click Button    xpath=//button[@type='submit']

Verify Submit
    [Documentation]    Vérifie que la soumission a réussi (redirection ou message).
    Wait Until Page Contains    Upgrade    10s