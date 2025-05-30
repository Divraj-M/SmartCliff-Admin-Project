*** Settings ***
Library    SeleniumLibrary
Documentation    Test to logout
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LogoutResource.robot

*** Test Cases ***
validate successful logout
    [Tags]    Regression    smoke
    Fill the valid Login Credentials
    logout from current session
    




