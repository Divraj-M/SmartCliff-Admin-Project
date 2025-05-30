*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${MenuButton}               xpath://button[contains(@class,'MuiIconButton-root')]
${AboutinMenu}              xpath://span[contains(text(),'About')]
${Vision&Mission}           xpath://span[contains(text(),'Vision & Mission')]
${vision&MissionPannelheading}    xpath://h4[contains(text(),'Vision & Mission Panel')]
${back}                     xpath://button[text()='Back']
${addvisionandmission}      xpath://button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-1hw9j7s']
${description}    xpath://textarea[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMultiline css-u36398' and @name='description']
${add_content}              xpath://button[contains(text(),'Add Content')]
${deletebtn}                xpath://button[contains(@class,'MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc')]
${searchbtn}                xpath://input[contains(@class,'MuiInputBase-input')]
${missiondropdown}    xpath://div[@class='MuiSelect-select MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input css-qiwgdb']
${Mission}    xpath://li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1km1ehz']
${submitcontent}    xpath://button[contains(text(),'Submit Content')]
${Avengers}    Avengers
${listofdescriptions}    xpath://tr[@class='MuiTableRow-root css-1gqug66']//child::td[2]
${pagedropdownnum}    xpath://div[@class='MuiInputBase-root MuiInputBase-colorPrimary MuiTablePagination-input css-rmmij8']
${five}    xpath://li[@data-value='5']
${canceldelete}    xpath://button[@class='MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-n81xtf']
${nextpage}        xpath://button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit MuiIconButton-sizeMedium css-1deacqj']



*** Keywords ***
click the drop down for page view
    Click Element    ${pagedropdownnum}
    Wait Until Element Is Visible    ${five}
    Click Element    ${five}
    ${elements}=    Get WebElements    ${listofdescriptions}
    ${texts}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${texts}    ${text}
    END
    Log    List of texts: ${texts}
    ${count}=    Get Length    ${texts}
    Should Be Equal As Integers    ${count}    5
    RETURN    ${texts}



Click the about in the menu list
    Wait Until Element Is Visible    ${MenuButton}    
    Click Element    ${MenuButton}
    Wait Until Element Is Visible    ${AboutinMenu}
    Click Element    ${AboutinMenu}

click the vision&Mission in the list
    Wait Until Element Is Visible    ${Vision&Mission}    
    Click Element    ${Vision&Mission}

Verify the user is successfully entered in the vision&mission page
    Wait Until Element Is Visible    ${vision&MissionPannelheading}
    Element Text Should Be    ${vision&MissionPannelheading}    VISION & MISSION PANEL

click the add vision and Mission
    Wait Until Element Is Visible    ${addvisionandmission}
    Click Button    ${addvisionandmission}

Verify the back buttion
    Click Element    ${back}
    Element Should Be Visible    ${addvisionandmission}

add the Description in the textarea
    [Arguments]    ${descriptiontext}
    Input Text    ${description}    ${descriptiontext}

click the add content
    [Arguments]    ${descriptiontext}
    Click Element    ${add_content}
    Wait Until Element Is Visible    ${addvisionandmission}
    Page Should Contain    ${descriptiontext}
    Click Element    xpath=//td[contains(text(),'${descriptiontext}')]//following-sibling::td//button[2]
    Wait Until Element Is Visible    ${deletebtn}
    Click Element    ${deletebtn}
    Wait Until Element Is Not Visible    ${deletebtn}    
    Page Should Not Contain    ${descriptiontext}

click the search bar and enter the description
    [Arguments]    ${descriptiontext}
    Input Text    ${searchbtn}    ${descriptiontext}
    

Verify the search bar
    [Arguments]    ${descriptiontext}
    Page Should Contain    ${descriptiontext}

Verify Vision Added
    [Arguments]    ${descriptiontext}
    Click the about in the menu list
    click the vision&Mission in the list
    click the add vision and Mission
    Wait Until Element Is Visible    ${add_content}
    Input Text    ${description}    ${descriptiontext}
    Wait Until Element Is Visible    ${add_content}
    Click Element    ${add_content}
    Wait Until Element Is Not Visible    ${add_content}
    Page Should Contain    ${descriptiontext}
    Click Element    xpath=//td[contains(text(),'${descriptiontext}')]//following-sibling::td//button[2]
    Wait Until Element Is Visible    ${deletebtn}
    Click Element    ${deletebtn}
    Wait Until Element Is Not Visible    ${deletebtn}    
    Page Should Not Contain    ${descriptiontext}


Delete the description from the table
    [Arguments]    ${descriptiontext}
    Wait Until Element Is Visible    xpath://td[contains(text(),'${descriptiontext}')]//following-sibling::td//div//child::button[2]
    Click Element    xpath://td[contains(text(),'${descriptiontext}')]//following-sibling::td//div//child::button[2]
    Wait Until Element Is Visible    ${deletebtn}
    Click Element    ${deletebtn}
    Wait Until Element Is Not Visible    ${deletebtn} 

Delete the description from the table as confirm
    [Arguments]    ${descriptiontext}
    Click Element    xpath://td[contains(text(),'${descriptiontext}')]//following-sibling::td//div//child::button[2]
    Click Element    ${canceldelete}
    Page Should Contain    ${descriptiontext} 

click the Mission in the dropdown
    Wait Until Element Is Visible    xpath://div[contains(text(),'Vision')]
    Click Element    xpath://div[contains(text(),'Vision')]
    Wait Until Element Is Visible    ${Mission}
    Click Element    ${Mission}


add the content in the vission
    Click Element    ${add_content}
    Wait Until Element Is Visible    ${addvisionandmission}
    
add the content
    Click Element    ${add_content}

Application error
    Wait Until Element Contains    xpath://h2    Unexpected Application Error!    
    Element Text Should Be    xpath://h2    Unexpected Application Error!



add the text to edit in vission
    [Arguments]    ${descriptiontext}
    Click Element    xpath://td[contains(text(),'${descriptiontext}')]//following-sibling::td//div//child::button[1]
    Click Element    ${description}
    FOR    ${i}    IN RANGE    15
    Press Keys    ${description}    BACKSPACE
    END
    Input Text    ${description}    ${Avengers}
    Click Element    ${submitcontent}
    Page Should Contain    ${Avengers}
    Wait Until Element Is Visible    xpath://td[contains(text(),'${Avengers}')]//following-sibling::td//div//child::button[2]
    Click Element    xpath://td[contains(text(),'${Avengers}')]//following-sibling::td//div//child::button[2]
    Wait Until Element Is Visible    ${deletebtn}     
    Click Element    ${deletebtn}  
    Wait Until Element Is Not Visible   ${deletebtn}
    Page Should Not Contain    ${Avengers}