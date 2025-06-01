*** Settings ***
Library    SeleniumLibrary
Documentation    Test on About us
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AboutUsResource.robot
Resource    ../Resources/YearlyService_Resource.robot
Library    DataDriver    file=../Utilities/YearlyServiceInputs.xlsx   sheet_name=Sheet1

*** Variables ***
${test_case_name}
${year}
${bussiness}
${service1}
${business2}
${service2}

*** Test Cases ***
Yearly service panel row addition and deletion validation
    [Tags]    Regression
    [Template]    validating multiple inputs on yearly service test form validation
    ${test_case_name}    ${year}    ${bussiness}    ${service1}    ${business2}    ${service2}

*** Keywords ***
validating multiple inputs on yearly service test form validation
    [Arguments]    ${test_case_name}    ${year}    ${bussiness}    ${service1}    ${business2}    ${service2}
    Run Keyword If    '${test_case_name}' == 'add_valid'    Add Valid Row in yerly service    ${year}    ${bussiness}    ${service1}
    ...    ELSE IF    '${test_case_name}' == 'delete_valid'    Delete Valid Row in yerly service    ${year}    ${bussiness}    ${service1}
    ...    ELSE IF    '${test_case_name}' == 'empty_year'    Add row without year in yerly service    ${bussiness}    ${service1}
    ...    ELSE IF    '${test_case_name}' == 'add_new_service'    add sub service in the service history panel    ${year}    ${bussiness}    ${service1}    ${service2}
    ...    ELSE IF    '${test_case_name}' == 'del_new_service'    delete subservice in yearly service history panel   ${year}    ${bussiness}    ${service1}    ${service2}

Add Valid Row in yerly service
    [Arguments]    ${year}    ${bussiness}    ${service1}
    Fill the valid Login Credentials
    click yearly service in side menu
    Click add new yearly service
    Add input year    ${year}
    Add input bussiness service    ${bussiness}
    add input service 1    ${service1}
    submit service data    
    click side right arrow
    the new row should be added    ${service1}    ${bussiness}
    
    delete the new row in yearly service history panel    ${service1}
    

delete Valid Row in yerly service
    [Arguments]    ${year}    ${bussiness}    ${service1}
    Fill the valid Login Credentials
    click yearly service in side menu
    Click add new yearly service
    Add input year    ${year}
    Add input bussiness service    ${bussiness}
    add input service 1    ${service1}
    submit service data    
    click side right arrow
    delete the new row in yearly service history panel    ${service1}
    the row should be deleted    ${service1}

Add row without year in yerly service
    [Arguments]    ${bussiness}    ${service1}
    Fill the valid Login Credentials
    click yearly service in side menu
    Click add new yearly service
    Add input bussiness service    ${bussiness}
    add input service 1    ${service1}
    submit service data    
    the user should see the input required popup for year

add sub service in the service history panel
    [Arguments]    ${year}    ${bussiness}    ${service1}    ${service2}
    Fill the valid Login Credentials
    click yearly service in side menu
    Click add new yearly service
    Add input year    ${year}
    Add input bussiness service    ${bussiness}
    add sub service 
    enter text in sub service    ${service2}
    add input service 1    ${service1}
    submit service data    
    click side right arrow
    the new row should be added    ${service2}    ${bussiness}
    delete the new row in yearly service history panel    ${service2}

delete subservice in yearly service history panel
    [Arguments]    ${year}    ${bussiness}    ${service1}    ${service2}
    Fill the valid Login Credentials
    click yearly service in side menu
    Click add new yearly service
    Add input year    ${year}
    Add input bussiness service    ${bussiness}
    add input service 1    ${service1}
    add sub service 
    enter text in sub service    ${service2}
    delete sub service
    newly added service should be removed    ${service2}

# add new business in yearly service history panel
#     [Arguments]    ${year}    ${bussiness}    ${service1}    ${service2}
#     Fill the valid Login Credentials
#     click yearly service in side menu
#     Click add new yearly service
#     Add input year    ${year}
#     Add input bussiness service    ${bussiness}
#     add input service 1    ${service1}
    
#     newly added service should be removed    ${service2}
   
    





    



