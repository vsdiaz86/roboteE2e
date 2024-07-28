*** Settings ***
Resource    ../../resources/variables/load_env.robot
Resource    ../../resources/keywords/ui/login_page.robot
Resource    ../../resources/keywords/ui/dashboard_page.robot

*** Variables ***
# As variáveis são carregadas do arquivo .env

*** Test Cases ***
Open Home Page and Verify
    Open Dashboard Page
    Verify Dashboard Page

Login with Valid Credentials
    Perform Login    ${USERNAME}    ${PASSWORD}
    Verify Dashboard Page
