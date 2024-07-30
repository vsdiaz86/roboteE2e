*** Settings ***
Resource    ../../resources/variables/load_env.robot
Resource    ../../resources/keywords/ui/login_page.robot
Resource    ../../resources/keywords/ui/dashboard_page.robot

*** Variables ***


*** Test Cases ***

Login with Valid Credentials and Logout
    Open Login Page
    Perform Login    ${USERNAME}    ${PASSWORD}
    Verify Dashboard Page
    Click Logout Button

Attempt Login with invalid Password
    Open Login Page
    Insert Invalid Password    ${USERNAME}   ${INVALID_PASSWORD}
    Verify Error Message

Attempt Login with invalid Username
    Open Login Page
    Insert Invalid Username    ${INVALID_USERNAME}    ${password}
    Verify Error Message