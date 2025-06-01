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
${yearly_Serv_page_drop}    xpath://*[@id="root"]/div[1]/main/div[3]/div[2]/div[2]/div/div[2]//div
${year_text_box}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/form/div[1]/div//child::input
${bussiness_text_box}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/form/div[2]/div/div[1]/div/div/child::input
${service_text_box}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/form/div[2]/div/div[3]/div/div/child::input
${submit_service_btn}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/form/child::button
${required_business}    css:div.MuiBox-root.css-uhsiip:nth-of-type(2)>div>div>div input
${add_sub_Service}    css:div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-12.MuiGrid-grid-md-6.css-1un23uk > button:nth-of-type(1)
${delete_service2}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/form/div[2]/div/div[3]/button
${new_service_txt_box}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/form/div[2]/div/div[4]/div/div/input

${del}    css:#root > div.MuiBox-root.css-k008qs > main > div.MuiBox-root.css-17babdh > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation3.css-vuzb25 > div.MuiTableContainer-root.css-kge0eu > table > tbody > tr > td:nth-child(3) > button.MuiButtonBase-root.MuiButton-root.MuiButton-outlined.MuiButton-outlinedError.MuiButton-sizeMedium.MuiButton-outlinedSizeMedium.MuiButton-root.MuiButton-outlined.MuiButton-outlinedError.MuiButton-sizeMedium.MuiButton-outlinedSizeMedium.css-1q8c092
${del_again_service}    css:body > div.MuiDialog-root.MuiModal-root.css-126xj0f > div.MuiDialog-container.MuiDialog-scrollPaper.css-ekeie0 > div > div.MuiDialogActions-root.MuiDialogActions-spacing.css-33pgcr > button.MuiButtonBase-root.MuiButton-root.MuiButton-contained.MuiButton-containedError.MuiButton-sizeMedium.MuiButton-containedSizeMedium.MuiButton-root.MuiButton-contained.MuiButton-containedError.MuiButton-sizeMedium.MuiButton-containedSizeMedium.css-1ecefdc   
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

click dropdown and change value to
    [Arguments]    ${dropdown_val}
    Click Element    ${yearly_Serv_page_drop}
    Click Element    //div[@id="menu-"]/div[3]//ul/li[contains(text(),${dropdown_val})]

Retrive the rows in page
    ${rows_page_1}=    Get Element Count    ${yearly_serv_table_rows}
    Log To Console    Rows on first page: ${rows_page_1}
    RETURN    ${rows_page_1}

the row count should be changed
    [Arguments]    ${retrived_count}    ${expected_count}
    ${retrived_count}=    Convert To Integer    ${retrived_count}
    ${expected_count}=    Convert To Integer    ${expected_count}

    ${result}=    Run Keyword And Return Status    Evaluate    ${retrived_count} > 5 and ${retrived_count} <= ${expected_count}
    RETURN    ${result}

Add input year
    [Arguments]    ${year}
    Input Text    ${year_text_box}    ${year}

Add input bussiness service    
    [Arguments]    ${bussiness}
    Input Text    ${bussiness_text_box}    ${bussiness}

add input service 1    
    [Arguments]    ${service1}
    Input Text    ${service_text_box}    ${service1}

submit service data
    Click Element    ${submit_service_btn}

the new row should be added
    [Arguments]    ${service1}    ${bussiness}
    Page Should Contain    ${service1}
    Page Should Contain    ${bussiness}     

delete the new row in yearly service history panel
    [Arguments]    ${service1}  
    Sleep    2s
    Wait Until Element Is Visible    //table//tr[td[contains(.,"${service1}")]]//button[2]
    Wait Until Element Is Enabled    //table//tr[td[contains(.,"${service1}")]]//button[2]

    Click Element    //table//tr[td[contains(.,"${service1}")]]//button[2]
    Sleep    2s
    # Wait Until Element Is Visible    ${del}
    # Click Element    ${del}
    Wait Until Element Is Enabled    ${del_again_service}
    Click Element    ${del_again_service}

the row should be deleted
    [Arguments]    ${service1}
    Page Should Not Contain    ${service1}

the user should see the input required popup for year
    ${valid}=    Execute JavaScript    return document.getElementById("year").checkValidity();
    Should Not Be True    ${valid}
    Log To Console  ${valid}

add sub service 
    Click Element    ${add_sub_Service}

enter text in sub service
    [Arguments]    ${service2}
    Input Text    ${new_service_txt_box}    ${service2}

delete sub service
    Click Element    ${delete_service2}

newly added service should be removed
    [Arguments]    ${service2}
    page should not contain    ${service2}




