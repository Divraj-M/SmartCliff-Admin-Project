*** Settings ***
Library    SeleniumLibrary
Documentation    Test on About us
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AboutUsResource.robot
Library    DataDriver    file=../Utilities/LoginCredentials.xlsx    sheet_name=Sheet1

*** Test Cases ***
Validate about us landing page
    Fill the valid Login Credentials
    click about us in side menu
    User should see the AboutUs control panel

Validate row addition in about us panel
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form
    Check new row is added in about us panel
    delete the new row in about us panel
    logout from current session

validate the back button in about us form filling page
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    click back button in about us from
    User should see the AboutUs control panel

validate deletion of row in the control panel
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form
    Check new row is added in about us panel
    delete the new row in about us panel
    the specified row should be removed in about us panel

validate search in about us control panel
    Fill the valid Login Credentials
    click about us in side menu
    ${search_term}=    Set Variable    test
    Input Text    ${search_box}    ${search_term}
    Sleep    2s    
    @{titles}=    Extract Titles From Table
    Log Many    @{titles}
    Validate Search Results    ${search_term}



   

