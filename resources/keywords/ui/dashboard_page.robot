*** Settings ***
Library    Browser
Resource   ../../variables/load_env.robot

*** Variables ***
${DASHBOARD_TEXT}   xpath=//span[@class="ms-1 font-weight-bold"]

*** Keywords ***
Verify Dashboard Page
    ${element}=    Get Text    ${DASHBOARD_TEXT}
    Should Be Equal As Strings    ${element.strip()}    Argon Dashboard 2
