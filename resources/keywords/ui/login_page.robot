*** Settings ***
Library    Browser
Resource   ../../variables/load_env.robot

*** Variables ***
${LOGIN_URL}        ${None}
${USERNAME_INPUT}   id=username_login
${PASSWORD_INPUT}   id=pwd_login
${LOGIN_BUTTON}     [name="login"]
${LOGOUT_BUTTON}   xpath=//span[@class="d-sm-inline d-none"]
${LOGIN_TEXT}   xpath=//a[@class="navbar-brand font-weight-bolder ms-lg-0 ms-3 "]
${INVALID_PASSWORD}    QWER123
${INVALID_USERNAME}    QWER123
${ERROR_MESSAGE}    xpath=//span[@class="text-danger"]


*** Keywords ***
Open Login Page
    Load Environment Variables
    ${LOGIN_URL}=    Set Variable    ${BASE_URL}/login
    ${headless_flag}=    Evaluate    ${HEADLESS} == 'true'
    New Browser    browser=${BROWSER}  headless=${headless_flag}
    New Page    ${LOGIN_URL}
    Wait For Elements State    ${LOGIN_TEXT}    visible
    Wait For Elements State    ${USERNAME_INPUT}    visible

Input Username
    [Arguments]    ${username}
    Fill Text    ${USERNAME_INPUT}    ${username}

Input Password
    [Arguments]    ${password}
    Fill Text    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click    ${LOGIN_BUTTON}

Perform Login
    [Arguments]    ${username}    ${password}
    Open Login Page
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button
    Wait For Load State    load

Insert Invalid Password
    [Arguments]    ${username}    ${INVALID_PASSWORD}
    Open Login Page
    Input Username    ${username}
    Input Password    ${INVALID_PASSWORD}
    Click Login Button
    Wait For Load State    load

Insert Invalid Username
    [Arguments]    ${INVALID_USERNAME}    ${password}
    Open Login Page
    Input Username    ${INVALID_USERNAME}
    Input Password    ${password}
    Click Login Button
    Wait For Load State    load

Verify Error Message
    ${element}=    Get Text    ${ERROR_MESSAGE}
    Should Be Equal As Strings    ${element.strip()}    Wrong user or password

Click Logout Button
    Click    ${LOGOUT_BUTTON}
    Wait For Elements State    ${LOGIN_TEXT}    visible


    
