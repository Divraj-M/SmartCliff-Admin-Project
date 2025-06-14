*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user_icon}    xpath://*[@id="appbar"]/div/button[2]
${logout_btn}    xpath://*[@id="account-menu"]/div[3]/ul/li[2]
${toast}    xpath://div[contains(@class, "Toastify__toast")]
${login_btn}    xpath://*[@id="signin-submit"]
${MAX_RETRIES}    3
${RETRY_COUNT}    0

*** Keywords ***
Logout From Current Session
    Wait Until Element Is Not Visible    ${toast}    timeout=15s
    ${logout_success}=    Set Variable    False
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
        Click Element    ${user_icon}
        Wait Until Element Is Visible    ${logout_btn}    timeout=5s
        Click Element    ${logout_btn}
        ${logout_success}=    Run Keyword And Return Status    Page Should Contain Element    ${login_btn}
        ${url}=    Get Location
        Log To Console    Current URL: ${url}
        Exit For Loop If    ${logout_success}
        ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    END
    IF    not ${logout_success}
        Fail    Logout failed after ${MAX_RETRIES} retries
    END

    