*** Settings ***
Library    SeleniumLibrary
Resource    LogoutResource.robot

*** Variables ***
${about_icon}    xpath://*[@id="drawer"]/div/ul/li[2]/div
${about_us}    xpath://*[@id="drawer"]/div/ul/li[2]/div[2]/div/div/div/div[1]
${add_abt_us_btn}    xpath://*[@id="root"]/div[1]/main/div[2]/div[1]/div[2]/button
${DROPZONE_AREA}    xpath://*[@id="root"]/div[1]/main/main/div/form/div[2]/div
${submit_content}    xpath://*[@id="root"]/div[1]/main/main/div/form/button
${content_title_input}    xpath=//*[@id="root"]/div[1]/main/main/div/form/div[1]/div//input
${content_text}    hello saranya
${IMAGE_PATH}    ${CURDIR}${/}about_us_images${/}Sunlit Park Walk.jpg
${del_again}    xpath:/html/body/div[2]/div[3]/div/div[2]/button[2]


*** Keywords ***
click about us in side menu
    Wait Until Element Is Visible    ${about_icon} 
    Click Element    ${about_icon}
    Wait Until Element Is Visible    ${about_us}
    Click Element    ${about_us}
    
fill add about us form
    
    Wait Until Element Is Not Visible    ${toast}    timeout=10s
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
     Page Should Not Contain    ${content_text}

