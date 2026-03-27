*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary

*** Keywords ***

Open Myinfo Page
    [Documentation]    Ouvre la page des détails personnels d’un employé
    Wait Until Element Is Visible    xpath=//span[text()='My Info']    10s
    Click Element                   xpath=//span[text()='My Info']

Load Myinfo Data
    [Documentation]    Charge les données employé depuis myinfo.json
    ${json}=    Load Json From File    ${CURDIR}/../data/myinfo.json

    Set Suite Variable    ${FIRST_NAME}              ${json['firstName']}
    Set Suite Variable    ${MIDDLE_NAME}             ${json['middleName']}
    Set Suite Variable    ${LAST_NAME}               ${json['lastName']}
    Set Suite Variable    ${EMPLOYEE_ID}             ${json['employeeId']}
    Set Suite Variable    ${OTHER_ID}                ${json['otherId']}
    Set Suite Variable    ${DRIVER_LICENSE}          ${json['driversLicenseNumber']}
    Set Suite Variable    ${LICENSE_EXPIRY}          ${json['licenseExpiryDate']}
    Set Suite Variable    ${NATIONALITY}             ${json['nationality']}
    Set Suite Variable    ${MARITAL_STATUS}          ${json['maritalStatus']}
    Set Suite Variable    ${DOB}                     ${json['dateOfBirth']}

Fill Myinfo Form
    [Documentation]    Remplit le formulaire "Myinfo" avec tous les champs et soumet
    Open Myinfo Page
    Wait Until Element Is Visible    name=firstName    20s
    Sleep    5s
    Click Element    name=firstName
    SeleniumLibrary.Press Keys       name=firstName    CTRL+A+BACKSPACE
    Input Text    name=firstName    ${FIRST_NAME}
    Click Element    name=middleName
    SeleniumLibrary.Press Keys       name=middleName    CTRL+A+BACKSPACE
    Input Text    name=middleName      ${MIDDLE_NAME}
    Click Element    name=lastName
    SeleniumLibrary.Press Keys       name=lastName    CTRL+A+BACKSPACE
    Input Text    name=lastName        ${LAST_NAME}  
    #employee id
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[1]/div/div[2]/input
    SeleniumLibrary.Press Keys       //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[1]/div/div[2]/input    CTRL+A+BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[1]/div/div[2]/input    ${EMPLOYEE_ID}
    #contact number
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[2]/div/div[2]/input
    SeleniumLibrary.Press Keys       //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[2]/div/div[2]/input    CTRL+A+BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[2]/div/div[2]/input    ${OTHER_ID}
    #driver's license number
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[2]/div[1]/div/div[2]/input
    SeleniumLibrary.Press Keys       //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[2]/div[1]/div/div[2]/input    CTRL+A+BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[2]/div[1]/div/div[2]/input    ${DRIVER_LICENSE}
    #license expiry date
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[2]/div[2]/div/div[2]/div/div/input
    SeleniumLibrary.Press Keys       //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[2]/div[2]/div/div[2]/div/div/input    CTRL+A+BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[2]/div[2]/div/div[2]/div/div/input    ${LICENSE_EXPIRY}
    #nationality
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[3]/div[1]/div[1]/div/div[2]/div/div    10s
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[3]/div[1]/div[1]/div/div[2]/div/div
    Wait Until Element Is Visible    xpath=//div[@role='listbox']    10s
    Wait Until Element Is Visible    xpath=//div[@role='listbox']//*[contains(text(),'${NATIONALITY}')]    10s
    Click Element    xpath=//div[@role='listbox']//*[contains(text(),'${NATIONALITY}')]
    #marital status
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[3]/div[1]/div[2]/div/div[2]/div/div/div[1]    10s
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[3]/div[1]/div[2]/div/div[2]/div/div/div[1]
    Wait Until Element Is Visible    xpath=//div[@role='listbox']    10s
    Wait Until Element Is Visible    xpath=//div[@role='listbox']//*[contains(text(),'${MARITAL_STATUS}')]    10s
    Click Element    xpath=//div[@role='listbox']//*[contains(text(),'${MARITAL_STATUS}')]
    #date of birth
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[3]/div[2]/div[1]/div/div[2]/div/div/input
    SeleniumLibrary.Press Keys       //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[3]/div[2]/div[1]/div/div[2]/div/div/input    CTRL+A+BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[3]/div[2]/div[1]/div/div[2]/div/div/input    ${DOB}
    #gender
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[3]/div[2]/div[2]/div/div[2]/div[1]/div[2]/div/label
    #save
    Click Button     //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[5]/button

