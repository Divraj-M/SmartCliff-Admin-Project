*** Settings ***
Library    SeleniumLibrary
Resource    LogoutResource.robot
Resource    AboutUsResource.robot

*** Variables ***
${yearly_service_btn}    xpath://div[contains(@id,'drawer')]/div/ul/li[2]/div[2]/div/div/div/div[4]
${add_new_yearly_service_btn}    xpath://div[contains(@id,'root')]/div[1]/main/div[3]/div[1]/div[2]/button
${back_button}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/div/button/span[1]
${search_box_yearly_Serv}    xpath://*[@id="root"]/div[1]/main/div[3]/div[1]/div[1]/div/div//input
${columns_yearly_serv}    xpath://*[@id="root"]/div[1]/main/div[3]/div[2]/div[1]/table/tbody//tr//td[1]
${columns_yearly__business_serv}    xpath://*[@id="root"]/div[1]/main/div[3]/div[2]/div[1]/table/tbody//tr//td[2]
${yearly_service_page_arrow_right}    xpath://*[@id="root"]/div[1]/main/div[3]/div[2]/div[2]/div/div[3]/button[2]
${yearly_serv_table_rows}    xpath://*[@id="root"]/div[1]/main/div[3]/div[2]/div[1]/table/tbody//tr
${yearly_service_page_arrow_left}    xpath://*[@id="root"]/div[1]/main/div[3]/div[2]/div[2]/div/div[3]/button[1]
*** Keywords ***
click yearly service in side menu
    Wait Until Element Is Visible    ${about_icon}    timeout=10s
    Click Element    ${about_icon}
    Wait Until Element Is Visible    ${yearly_service_btn}    timeout=10s
    Click Element    ${yearly_service_btn}

User should see the yearly service history panel
    Page Should Contain    About History Panel

Click add new yearly service
    Click Button    ${add_new_yearly_service_btn}
    
click back button in yearly service from
    # Wait Until Element Is Not Visible    ${toast}    timeout=15s
    Wait Until Element Is Visible    ${back_button}
    Click Element    ${back_button} 
    

Extract Titles From yearly service Table
    [Arguments]    ${col}
    Wait Until Element Is Visible    ${col}    timeout=10s
    ${title_cells}=    Get WebElements    ${col}
    
    @{titles}=    Create List
    FOR    ${cell}    IN    @{title_cells}
        ${title}=    Get Text    ${cell}
        Append To List    ${titles}    ${title}
        Log To Console    Title found: ${title}
    END
    RETURN    @{titles}

Validate Search in yearly servic Results
    
    [Arguments]    ${search_term}    ${col}
    # ${title_column}=    Set Variable    xpath://*[@id="root"]/div[1]/main/div[2]/div[2]/table/tbody/tr/td[1]
    Wait Until Element Is Visible    ${col}    timeout=10s
    ${title_cells}=    Get WebElements    ${col}
    
    Should Not Be Empty    ${title_cells}    msg=No results found for search term '${search_term}'
    
    FOR    ${cell}    IN    @{title_cells}
        ${title}=    Get Text    ${cell}
        Log To Console    ${title}
        Should Contain    ${title.lower()}    ${search_term.lower()}    msg=Title '${title}' doesn't contain search term '${search_term}'
    END

rows should not be displayed
    Page Should Not Contain Element    ${yearly_serv_table_rows}   

click side right arrow
    Wait Until Element Is Visible    ${yearly_service_page_arrow_right}
    Click Element    ${yearly_service_page_arrow_right}
 
click side left arrow
     Wait Until Element Is Visible    ${yearly_service_page_arrow_left}
    Click Element    ${yearly_service_page_arrow_left}
 
retrive all row from table
    @{rows_page_elements}=    Get WebElements    ${yearly_serv_table_rows}
    @{rows_page}=    Create List
    FOR    ${row}    IN    @{rows_page_elements}
        ${text}=    Get Text    ${row}
        Log To Console    ${text}
        Append To List    ${rows_page}    ${text}
    END
    Log Many    @{rows_page}
    RETURN    ${rows_page}