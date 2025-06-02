*** Settings ***
Documentation    Tests to validate Forgot Password functionality
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResource.robot
Library    DataDriver    file=../Utilities/ForgotPasswordData.xlsx    sheet_name=Sheet1
# Test Template    Validate Forgot Password in SmartCliff

*** Variables ***
${email}

*** Test Cases ***
# Validate Forgot Password with    ${email}

# *** Keywords ***
# Validate Forgot Password in SmartCliff
#     [Arguments]    ${email}
#     Click on forgot password link
#     Enter email for password reset    ${email}
#     Click on send reset email

#     IF    '${email}' == ''
#         Verify error message for empty email
#     ELSE IF    '${email}' == 'invalid@example.com'
#         Verify error message for invalid email
#     ELSE
#         Verify reset email sent message is displayed
#     END
