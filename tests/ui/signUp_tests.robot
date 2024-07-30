*** Settings ***
Resource    ../../resources/variables/load_env.robot
Resource    ../../resources/keywords/ui/login_page.robot
Resource    ../../resources/keywords/ui/dashboard_page.robot
Resource    ../../resources/keywords/ui/signUp_page.robot

*** Variables ***


*** Test Cases ***

Sign UP With Success
    Open Login Page
    Click Sign UP Button
    Verify Sign UP Page
    ${username}=    Generate Random Username
    ${email}=       Generate Random Email
    Fill Registration Form    ${username}    ${email}    ${PASSWORD}
    Verify Registration Successful
