*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user_icon}    xpath://*[@id="appbar"]/div/button[2]
${logout_btn}    xpath://*[@id="account-menu"]/div[3]/ul/li[2]
${toast}    xpath://div[contains(@class, "Toastify__toast")]
${login_btn}    xpath://*[@id="signin-submit"]
${MAX_RETRIES}    3
${RETRY_COUNT}    0