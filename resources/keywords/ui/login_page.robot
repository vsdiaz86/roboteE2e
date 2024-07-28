*** Settings ***
Library    Browser
Resource   ../../variables/load_env.robot

*** Variables ***
${LOGIN_URL}        ${None}
${USERNAME_INPUT}   id=username_login
${PASSWORD_INPUT}   id=pwd_login
${LOGIN_BUTTON}     xpath=//button[@name="login" and text()="Sign IN"]

*** Keywords ***
Open Login Page
    Load Environment Variables
    ${LOGIN_URL}=    Set Variable    ${BASE_URL}/login
    New Browser    browser=chromium  headless=False
    New Page    ${LOGIN_URL}
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
