*** Settings ***
Library    SeleniumLibrary
Documentation    Test on About us
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AboutUsResource.robot
Resource    ../Resources/YearlyService_Resource.robot

*** Variables ***
${dropdown_Val}    10

*** Test Cases ***
Validate about us landing page of yearly service
    [Tags]    Regression
    Fill the valid Login Credentials
    click yearly service in side menu
    User should see the yearly service history panel

Validate back button in History Data Add Form
    [Tags]    Regression
    Fill the valid Login Credentials
    click yearly service in side menu
    Click add new yearly service
    click back button in yearly service from
    User should see the yearly service history panel

validate search year in yearly service panel
    [Tags]    Regression
    Fill the valid Login Credentials
    click yearly service in side menu
    ${search_keyword}=    Set Variable    2023
    Input Text    ${search_box_yearly_Serv}    ${search_keyword}
    Sleep    2s    
    @{titles}=    Extract Titles From yearly service Table    ${columns_yearly_serv}
    Log Many    @{titles}
    Validate Search in yearly servic Results    ${search_keyword}    ${columns_yearly_serv}

validate search Business service in yearly service panel
    [Tags]    Regression
    Fill the valid Login Credentials
    click yearly service in side menu
    ${search_keyword}=    Set Variable    b2b
    Input Text    ${search_box_yearly_Serv}    ${search_keyword}
    Sleep    2s    
    @{titles}=    Extract Titles From yearly service Table    ${columns_yearly__business_serv}
    Log Many    @{titles}
    Validate Search in yearly servic Results    ${search_keyword}    ${columns_yearly__business_serv}

validate invalid search in yearly service panel
    [Tags]    Regression
    Fill the valid Login Credentials
    click yearly service in side menu
    ${search_keyword}=    Set Variable    hello
    Input Text    ${search_box_yearly_Serv}    ${search_keyword}
    rows should not be displayed


validate working of pagination right arrow in yearly service panel
    [Tags]    Regression
    Fill the valid Login Credentials
    click yearly service in side menu
    @{list1}=    retrive all row from table
    click side right arrow
    Sleep    1s
    @{list2}=    retrive all row from table
    Should Not Be Equal    @{list1}    @{list2}

validate working of pagination left arrow in yearly service panel
    [Tags]    Regression
    Fill the valid Login Credentials
    click yearly service in side menu
    @{list1}=    retrive all row from table
    click side right arrow
    click side left arrow
    Sleep    1s
    @{list2}=    retrive all row from table
#     Should Be Equal    ${list1}    ${list2}

validate pageination is dropdown is working
    [Tags]    Regression
    Fill the valid Login Credentials
    click yearly service in side menu
    click dropdown and change value to    ${dropdown_Val}
    ${rows_page_1}=    Retrive the rows in page    
    ${pagination_works}=    the row count should be changed    ${rows_page_1}    ${dropdown_Val}
    Should Be True    ${pagination_works}



    
# validate working of pagination arrow in yearly service panel
#     [Tags]    Regression
#     Fill the valid Login Credentials
#     click yearly service in side menu
#     ${rows_page_1}=    Get Element Count    ${yearly_serv_table_rows}
#     Log To Console    Rows on first page: ${rows_page_1}
#     click side right arrow
#     Sleep    2s
#     ${rows_page_2}=    Get Element Count    ${yearly_serv_table_rows}
#     Log To Console    Rows on second page: ${rows_page_2}
#     Should Not Be Equal As Integers    ${rows_page_1}    ${rows_page_2}