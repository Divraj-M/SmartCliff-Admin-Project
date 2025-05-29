*** Settings ***
Library    SeleniumLibrary
Resource    LogoutResource.robot
Library    Collections

*** Variables ***
${about_icon}    xpath://div[contains(@id,'drawer')]/div/ul/li[2]/div
${about_us}    xpath://div[contains(@id,'drawer')]/div/ul/li[2]/div[2]/div/div/div/div[1]
${about_us_page_heading}    class:"MuiTypography-root MuiTypography-h4 css-ajejvb"
${add_abt_us_btn}    xpath://div[contains(@id,'root')]/div[1]/main/div[2]/div[1]/div[2]/button
${back_btn}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/div/button
${DROPZONE_AREA}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/form/div[2]/div
${submit_content}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/form/button
${content_title_input}    xpath://div[contains(@id,'root')]/div[1]/main/main/div/form/div[1]/div//child::input
${content_text}    test case 2
${IMAGE_PATH}    ${CURDIR}${/}about_us_images${/}Sunlit Park Walk.jpg
${del_again}    xpath:/html/body/div[2]/div[3]/div/div[2]/button[2]
${search_box}    xpath://div[contains(@id,'root')]/div[1]/main/div[2]/div[1]/div[1]/div/div//input
${title_column}    xpath://div[contains(@id,'root')]/div[1]/main/div[2]/div[2]/table/tbody//tr//td[1]

*** Keywords ***
click about us in side menu
    Wait Until Element Is Visible    ${about_icon}    timeout=10s
    Click Element    ${about_icon}
    Wait Until Element Is Visible    ${about_us}    timeout=10s
    Click Element    ${about_us}
    
fill add about us form
    
    Wait Until Element Is Not Visible    ${toast}    timeout=15s
    Input Text    ${content_title_input}    ${content_text}
   
    Wait Until Element Is Visible    ${DROPZONE_AREA}
    Wait Until Element Is Enabled    ${DROPZONE_AREA}
    
    Click Element    ${DROPZONE_AREA}
    Sleep    1s  
    ${file_input}=    Set Variable    css:input[type="file"][accept="image/*"]
    
   
    Choose File    ${file_input}    ${IMAGE_PATH}
    # Wait Until Page Contains Element    css:.MuiDropzonePreviewList-image    10s
    
    Click Button    ${submit_content}
    Sleep    5s
    
click add about us button
    Click Button    ${add_abt_us_btn}


Check new row is added in about us panel
    Page Should Contain    ${content_text}

delete the new row in about us panel
     Click Element    xpath=//td[contains(text(),'${content_text}')]//following-sibling::td//button[2]
     Click Button    ${del_again}
     Sleep    1s

the specified row should be removed in about us panel
    Page Should Not Contain    ${content_text}

click back button in about us from
    Click Button    ${back_btn}

User should see the AboutUs control panel
    Page Should Contain    About Us Content Panel

enter text in search bar
    Input Text    ${search_box}    "test"

the rows with matching text should be displayed
    Extract Titles From Table
    
Extract Titles From Table
   
    # ${title_column}=    Set Variable    xpath://*[@id="root"]/div[1]/main/div[2]/div[2]/table/tbody/tr/td[1]
    Wait Until Element Is Visible    ${title_column}    timeout=10s
    ${title_cells}=    Get WebElements    ${title_column}
    
    @{titles}=    Create List
    FOR    ${cell}    IN    @{title_cells}
        ${title}=    Get Text    ${cell}
        Append To List    ${titles}    ${title}
        Log To Console    Title found: ${title}
    END
    [Return]    @{titles}

Validate Search Results
    
    [Arguments]    ${search_term}
    # ${title_column}=    Set Variable    xpath://*[@id="root"]/div[1]/main/div[2]/div[2]/table/tbody/tr/td[1]
    Wait Until Element Is Visible    ${title_column}    timeout=10s
    ${title_cells}=    Get WebElements    ${title_column}
    
    Should Not Be Empty    ${title_cells}    msg=No results found for search term '${search_term}'
    
    FOR    ${cell}    IN    @{title_cells}
        ${title}=    Get Text    ${cell}
        Log To Console    ${title}
        Should Contain    ${title.lower()}    ${search_term.lower()}    msg=Title '${title}' doesn't contain search term '${search_term}'
    END


