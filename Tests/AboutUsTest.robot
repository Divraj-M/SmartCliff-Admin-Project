*** Settings ***
Library    SeleniumLibrary
Documentation    Test on About us
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AboutUsResource.robot



*** Test Cases ***
Validate row addition in about us panel
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form
    Check new row is added in about us panel
    delete the new row in about us panel
    logout from current session




