*** Settings ***
Library    SeleniumLibrary
Documentation    Test on About us
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AboutUsResource.robot

*** Test Cases ***
Validate about us landing page
    [Tags]    Regression
    Fill the valid Login Credentials
    click about us in side menu
    User should see the AboutUs control panel

validate the back button in about us form filling page
    [Tags]    Regression
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    click back button in about us from
    User should see the AboutUs control panel

validate search in about us control panel
    [Tags]    Regression
    Fill the valid Login Credentials
    click about us in side menu
    ${search_keyword}=    Set Variable    test
    Input Text    ${search_box}    ${search_keyword}
    Sleep    2s    
    @{titles}=    Extract Titles From Table
    Log Many    @{titles}
    Validate Search Results    ${search_keyword}

validate invalid search in about us control panel
    [Tags]    Regression
    Fill the valid Login Credentials
    click about us in side menu
    ${search_keyword}=    Set Variable    invalid text
    Input Text    ${search_box}    ${search_keyword}
    page should not contain entries 
