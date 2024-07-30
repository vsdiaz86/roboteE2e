*** Settings ***
Library    OperatingSystem
Library    Collections
Library    Process
Library    BuiltIn

*** Variables ***
${BASE_URL}    ${None}
${USER}    ${None}
${PASS}    ${None}
${BROWSER}     ${None}
${HEADLESS}    ${None}

*** Keywords ***
Load Environment Variables
    ${result}    Run Process    python    -c    from load_env import get_env_variable; print(get_env_variable("BASE_URL"))    shell=True
    Set Suite Variable    ${BASE_URL}    ${result.stdout.strip()}
    ${result}    Run Process    python    -c    from load_env import get_env_variable; print(get_env_variable("USER"))    shell=True
    Set Suite Variable    ${USERNAME}    ${result.stdout.strip()}
    ${result}    Run Process    python    -c    from load_env import get_env_variable; print(get_env_variable("PASS"))    shell=True
    Set Suite Variable    ${PASSWORD}    ${result.stdout.strip()}
    ${result}    Run Process    python    -c    from load_env import get_env_variable; print(get_env_variable("BROWSER"))    shell=True
    Set Suite Variable    ${BROWSER}    ${result.stdout.strip()}
    ${result}    Run Process    python    -c    from load_env import get_env_variable; print(get_env_variable("HEADLESS"))    shell=True
    Set Suite Variable    ${HEADLESS}    ${result.stdout.strip()}
