*** Settings ***
Library    Browser
Library    String
Resource   ../../variables/load_env.robot

*** Variables ***
${SIGNUP_BUTTON}   xpath=//a[@class="text-primary text-gradient font-weight-bold"]
${SIGNUP_TEXT}   xpath=//p[@class="text-lead text-white"]
${SIGNUP_OK}   xpath=//span[@class="text-info"]

*** Keywords ***
Click Sign UP Button
    Click    ${SIGNUP_BUTTON}
    Wait For Load State    load
    
Verify Sign UP Page
    ${element}=    Get Text    ${SIGNUP_TEXT}
    Should Be Equal As Strings    ${element.strip()}    Open-Source Seed Project

Fill Registration Form
    [Arguments]    ${username}    ${email}    ${password}
    Fill Text    id=username_create    ${username}
    Fill Text    id=email_create       ${email}
    Fill Text    id=pwd_create    ${password}
    Click    [name="register"]

Generate Random Username
    ${username}=    Generate Random String    10
    RETURN    user${username}

Generate Random Email
    ${email}=    Generate Random String    10
    RETURN    email${email}@example.com

Verify Registration Successful
    ${element}=    Get Text    ${SIGNUP_OK}
    Should Be Equal As Strings    ${element.strip()}    User created successfully.


