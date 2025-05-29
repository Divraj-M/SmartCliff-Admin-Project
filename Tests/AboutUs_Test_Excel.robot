*** Settings ***
Library    SeleniumLibrary
Documentation    Test on About us
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AboutUsResource.robot
Library    DataDriver    file=../Utilities/AboutUsInput.xlsx    sheet_name=Sheet1

*** Variables ***
${content_text}
${test_case_name}

*** Test Cases ***
AboutUs panel row addition and deletion validation
    [Template]    validating multiple inputs on test form validation
    ${content_text}    ${test_case_name}

*** Keywords ***
validating multiple inputs on test form validation
    [Arguments]    ${content_text}    ${test_case_name}
    Run Keyword If    '${test_case_name}' == 'add_valid'    Add Valid Row    ${content_text}
    ...    ELSE IF    '${test_case_name}' == 'delete_valid'    Delete Valid Row    ${content_text}
    ...    ELSE IF    '${test_case_name}' == 'empty_title'    Add row without title   ${content_text} 
Add Valid Row
    [Arguments]    ${content_text}
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form    ${content_text}
    Check new row is added in about us panel    ${content_text}
    delete the new row in about us panel    ${content_text}
    logout from current session

Add row without title
    [Arguments]    ${content_text}
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form    ${content_text}
    User should see title waring warning


Delete Valid Row
    [Arguments]    ${content_text}
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form    ${content_text}
    Check new row is added in about us panel    ${content_text}
    delete the new row in about us panel    ${content_text}
    the specified row should be removed in about us panel    ${content_text}
