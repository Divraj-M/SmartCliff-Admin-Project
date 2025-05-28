*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${instruction}              xpath://h5[@class='MuiTypography-root MuiTypography-h5 css-1f7j8xw']
${error_message_in_email}         xpath://p[@id='signin-email-helper-text']
${error_message_in_password}    xpath://p[@id='signin-password-helper-text']


*** Keywords ***
Fill the login form
    [Arguments]    ${email}    ${password}
    Input Text    xpath://input[@id='signin-email']    ${email}
    Input Password    xpath://input[@id='signin-password']    ${password}
    Click Button    xpath://button[@id='signin-submit']


Verify the user is successfully logged in
    Element Text Should Be    ${instruction}    Admin Panel Instructions

Verify the user get the error message by email field empty
    Element Text Should Be    ${error_message_in_email}    Email is required

Verify the user get error message by password field empty 
    Element Text Should Be    ${error_message_in_password}    Password is required

Verify the user get error message by both email and password field empty
    Element Text Should Be    ${error_message_in_email}    Email is required
    Element Text Should Be    ${error_message_in_password}    Password is required
