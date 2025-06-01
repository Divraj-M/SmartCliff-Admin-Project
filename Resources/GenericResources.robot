*** Settings ***
Documentation    Resource file for Smart Cliff Admin headless login test
Library    SeleniumLibrary

*** Variables ***
${valid_username}    abcraj@gmail.com
${valid_password}    Divraj@123    
${url}    https://smart-cliff-admin.vercel.app/
${browser_name}    Chrome

*** Keywords ***
Open the Browser with URL
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    ${browser_name}    options=${options}
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    10

Fill the valid Login Credentials
    Input Text    xpath://input[@id='signin-email']    ${valid_username}
    Input Password    xpath://input[@id='signin-password']    ${valid_password}
    Click Button    xpath://button[@id='signin-submit']

Close browser session
    Close Browser
