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
${new_title}

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
    ...    ELSE IF    '${test_case_name}' == 'empty_image'    Add row without image   ${content_text}
    ...    ELSE IF    '${test_case_name}' == 'remove_image'    Add row without image   ${content_text}
    ...    ELSE IF    '${test_case_name}' == 'same_title'    Add row with same title   ${content_text}
    ...    ELSE IF    '${test_case_name}' == 'edit_new_title'    edit title in the about us panel   ${content_text}    ${new_title}
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
    User should see title warning

Add row without image
    [Arguments]    ${content_text}
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form without image  ${content_text}
    User should see image warning

remove image from the form
    [Arguments]    ${content_text}
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill the form and remove image from form    ${content_text}
    the photo should be removed

Delete Valid Row
    [Arguments]    ${content_text}
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form    ${content_text}
    Check new row is added in about us panel    ${content_text}
    delete the new row in about us panel    ${content_text}
    the specified row should be removed in about us panel    ${content_text}

Add row with same title
    [Arguments]    ${content_text}
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form    ${content_text}
    Error alert sould be displayed

edit title in the about us panel
    [Arguments]    ${content_text}    ${new_title}
    Fill the valid Login Credentials
    click about us in side menu
    click add about us button
    fill add about us form    ${content_text}
    click edit button    ${content_text}
    change text in the title    ${new_title}
    update the content in edit form
    the user should see updated title    ${new_title}
    # delete the new row in about us panel    ${new_title}
    # the specified row should be removed in about us panel    ${new_title}




