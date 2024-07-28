*** Settings ***
Library    OperatingSystem
Library    Collections
Library    Process
Library    BuiltIn

*** Variables ***
${BASE_URL}    ${None}
${USERNAME}    ${None}
${PASSWORD}    ${None}

*** Keywords ***
Load Environment Variables
    ${result}    Run Process    python    -c    from load_env import get_env_variable; print(get_env_variable("BASE_URL"))    shell=True
    Set Suite Variable    ${BASE_URL}    ${result.stdout.strip()}
    ${result}    Run Process    python    -c    from load_env import get_env_variable; print(get_env_variable("USERNAME"))    shell=True
    Set Suite Variable    ${USERNAME}    ${result.stdout.strip()}
    ${result}    Run Process    python    -c    from load_env import get_env_variable; print(get_env_variable("PASSWORD"))    shell=True
    Set Suite Variable    ${PASSWORD}    ${result.stdout.strip()}
