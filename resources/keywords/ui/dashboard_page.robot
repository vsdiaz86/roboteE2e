*** Settings ***
Library    Browser
Resource   ../../variables/load_env.robot

*** Variables ***
${DASHBOARD_TEXT}   xpath=//a[@class="navbar-brand font-weight-bolder ms-lg-0 ms-3 "]

*** Keywords ***
Open Dashboard Page
    Load Environment Variables
    New Page    ${BASE_URL}
    Wait For Elements State    ${DASHBOARD_TEXT}    visible

Verify Dashboard Page
    ${element}=    Get Text    ${DASHBOARD_TEXT}
    Should Be Equal As Strings    ${element.strip()}    Argon Dashboard 2
