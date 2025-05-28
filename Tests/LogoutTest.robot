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
    sleep    5s
    logout from current session

*** Keywords ***
Logout From Current Session
    Wait Until Element Is Not Visible    ${toast}    timeout=10s
    Click Element    ${user_icon}
    Wait Until Element Is Visible        ${logout_btn}    timeout=5s
    Click Element    ${logout_btn}
    Page Should Contain                  Login



