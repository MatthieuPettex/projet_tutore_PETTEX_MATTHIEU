*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary

*** Variables ***


*** Keywords ***

Load Candidate Data
    [Documentation]    Charge les données du candidat depuis recruitment.json
    ${json}=    Load Json From File    ${CURDIR}/../data/recruitment.json
    Set Suite Variable    ${CANDIDATE_FIRST_NAME}          ${json['firstName']}
    Set Suite Variable    ${CANDIDATE_MIDDLE_NAME}         ${json['middleName']}
    Set Suite Variable    ${CANDIDATE_LAST_NAME}           ${json['lastName']}
    Set Suite Variable    ${CANDIDATE_JOB_TITLE}           ${json['jobTitle']}
    Set Suite Variable    ${CANDIDATE_EMAIL}               ${json['email']}
    Set Suite Variable    ${CANDIDATE_CONTACT}             ${json['contact']}
    Set Suite Variable    ${CANDIDATE_KEYWORDS}            ${json['keywords']}
    Set Suite Variable    ${CANDIDATE_APPLICATION_DATE}    ${json['applicationDate']}
    Set Suite Variable    ${CANDIDATE_NOTE}                ${json['note']}


Open Recruitment Page
    [Documentation]    Ouvre la page de recrutement
    Wait Until Element Is Visible    xpath=//span[text()='Recruitment']    10s
    Click Element                   xpath=//span[text()='Recruitment']


Fill Candidate Form
    Open Recruitment Page
    [Documentation]    Remplit le formulaire "Add Candidate" avec tous les champs et soumet
    Wait Until Element Is Visible    xpath=//button[contains(.,'Add')]    15s
    Scroll Element Into View        xpath=//button[contains(.,'Add')]
    Click Element                   xpath=//button[contains(.,'Add')]

    Wait Until Element Is Visible    name=firstName    10s
    Input Text    name=firstName    ${CANDIDATE_FIRST_NAME}
    Input Text    name=middleName      ${CANDIDATE_MIDDLE_NAME}
    Input Text    name=lastName        ${CANDIDATE_LAST_NAME}

    #vacancy
    Click Element    xpath=//label[text()='Vacancy']/ancestor::div[contains(@class,'oxd-input-group')]//div[contains(@class,'oxd-select-text')]
    Wait Until Element Is Visible    xpath=//div[@role='listbox']    10s
    Wait Until Element Is Visible    xpath=//div[@role='listbox']//*[contains(text(),'${CANDIDATE_JOB_TITLE}')]    10s

    Click Element    xpath=//div[@role='listbox']//*[contains(text(),'${CANDIDATE_JOB_TITLE}')]

    #email
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[3]/div/div[1]/div/div[2]/input    ${CANDIDATE_EMAIL}
    #contact number
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[3]/div/div[2]/div/div[2]/input    ${CANDIDATE_CONTACT}
    #keywords
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[5]/div/div[1]/div/div[2]/input    ${CANDIDATE_KEYWORDS}
    #application date
    #Click Element    xpath=//label[text()='Date of Application']/following::input[1]
    #Input Text      xpath=//label[text()='Date of Application']/following::input[1]    ${CANDIDATE_APPLICATION_DATE}
    #Press Keys      xpath=//label[text()='Date of Application']/following::input[1]    RETURN
    
    #note
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[6]/div/div/div/div[2]/textarea    ${CANDIDATE_NOTE}
    Click Element    xpath=//label[text()='Consent to keep data']/following::i[1]
    Click Button     xpath=//button[contains(.,'Save')]

Add Candidate
    [Documentation]    Remplit le formulaire et envoie le candidat
    Open Recruitment Page
    Fill Candidate Form

Search Candidate
    [Documentation]    Recherche un candidat par prénom et nom
    Open Recruitment Page
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/div/div[1]/div/div[2]/div/div/input
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/div/div[1]/div/div[2]/div/div/input    ${CANDIDATE_FIRST_NAME}
    Wait Until Element Is Visible    xpath=//div[@role='listbox']//*[contains(.,'${CANDIDATE_FIRST_NAME}')]    10s
    Click Element    xpath=//div[@role='listbox']//*[contains(.,'${CANDIDATE_FIRST_NAME}')]
    Click Element    xpath=//button[contains(.,'Search')]


See Candidate
    Search Candidate
    [Documentation]    Va voir le candidat recherché (ex: changer job title)
    #clique sur l'oeil
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[7]/div/button[1]    10s
    Click Button    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[7]/div/button[1]
    #clique sur reject
    Wait Until Element Is Visible    xpath=//button[contains(.,'Reject')]    10s
    Click Button    xpath=//button[contains(.,'Reject')]
    #clique sur cancel
    Wait Until Element Is Visible    xpath=//button[contains(.,'Cancel')]    10s
    Click Button    xpath=//button[contains(.,'Cancel')]
    #clique sur shortlist
    Wait Until Element Is Visible    xpath=//button[contains(.,'Shortlist')]    10s
    Click Button    xpath=//button[contains(.,'Shortlist')]
    #note
    Wait Until Element Is Visible    xpath=//label[text()='Notes']/following::textarea[1]    10s
    Input Text    xpath=//label[text()='Notes']/following::textarea[1]    You are shortlisted !
    #clique sur save
    Wait Until Element Is Visible    xpath=//button[contains(.,'Save')]    10s
    Click Button    xpath=//button[contains(.,'Save')]
    

Delete Candidate
    [Documentation]    Supprime le candidat recherché
    Search Candidate
    #delete
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[7]/div/button[2]
    Click Button    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[7]/div/button[2]
    #yes, delete
    Wait Until Element Is Visible    xpath=//button[contains(.,'Yes, Delete')]    10s
    Click Button    xpath=//button[contains(.,'Yes, Delete')]
    #verif
    Open Recruitment Page
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/div/div[1]/div/div[2]/div/div/input
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/div/div[1]/div/div[2]/div/div/input    ${CANDIDATE_FIRST_NAME}
    #verifie que le candidat n'existe plus
    Wait Until Element Is Visible    xpath=//div[@role='listbox']//*[contains(.,'No Records Found')]    10s