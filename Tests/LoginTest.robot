*** Settings ***
Documentation    Tests to Login
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResource.robot
Library    DataDriver    file=../Utilities/LoginCredentials.xlsx    sheet_name=Sheet1
Test Template    Validate Login in SmartCliff

*** Variables ***
${email}
${password}

*** Test Cases ***
Validate Login with    ${email}    ${password}

*** Keywords ***
Validate Login in SmartCliff
    [Arguments]    ${email}    ${password} 
    LoginResource.Fill the login form    ${email}    ${password}
    IF    '${email}' == '' and '${password}'==''
        LoginResource.Verify the user get error message by both email and password field empty
    ELSE IF    '${email}' == ''
        LoginResource.Verify the user get the error message by email field empty
    ELSE IF    '${password}' == ''
        LoginResource.Verify the user get error message by password field empty
    ELSE IF    '${email}' != '' and '${password}' != ''
        LoginResource.Verify the user is successfully logged in
    END