*** Settings ***
Library    SeleniumLibrary
Documentation    Test to logout
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LogoutResource.robot

*** Test Cases ***
validate successful logout
    Fill the valid Login Credentials
    logout from current session

*** Keywords ***
Logout From Current Session
    Wait Until Element Is Not Visible    ${toast}    timeout=10s
    ${logout_success}=    Set Variable    False
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
        Click Element    ${user_icon}
        Wait Until Element Is Visible    ${logout_btn}    timeout=5s
        Click Element    ${logout_btn}
        ${logout_success}=    Run Keyword And Return Status    Page Should Contain Element    ${login_btn}
        ${url}=    Get Location
        Log To Console    Current URL: ${url}
        Exit For Loop If    ${logout_success}
        Sleep    1s
        ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    END
    IF    not ${logout_success}
        Fail    Logout failed after ${MAX_RETRIES} retries
    END




