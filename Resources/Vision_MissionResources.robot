*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MenuButton}               xpath://button[contains(@class,'MuiIconButton-root')]
${AboutinMenu}              xpath://span[contains(text(),'About')]
${Vision&Mission}           xpath://span[contains(text(),'Vision & Mission')]
${vision&MissionPannelheading}    xpath://h4[contains(text(),'Vision & Mission Panel')]
${back}                     xpath://button[text()='Back']
${addvisionandmission}      xpath://*[@id="root"]/div[1]/main/div[3]/div[1]/div[2]/button
${description}    xpath://textarea[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMultiline css-u36398' and @name='description']
${add_content}              xpath://button[contains(text(),'Add Content')]
${deletebtn}                xpath://button[contains(@class,'MuiButton-containedError')]
${searchbtn}                xpath://input[contains(@class,'MuiInputBase-input')]
${missiondropdown}    xpath://*[@id=":rm:"]
${Mission}    xpath://li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1km1ehz']
${submitcontent}    xpath://*[@id="root"]/div[1]/main/main/div/form/div/div[3]/button
${Avengers}    Avengers

*** Keywords ***

Click the about in the menu list
    Sleep    2s
    Click Element    ${MenuButton}
    Click Element    ${AboutinMenu}

click the vision&Mission in the list
    Sleep    2s
    Click Element    ${Vision&Mission}

Verify the user is successfully entered in the vision&mission page
    Element Text Should Be    ${vision&MissionPannelheading}    VISION & MISSION PANEL

click the add vision and Mission
    Sleep    2s
    Click Button    ${addvisionandmission}

Verify the back buttion
    Click Element    ${back}
    Element Should Be Visible    ${addvisionandmission}

add the Description in the textarea
    [Arguments]    ${descriptiontext}
    Input Text    ${description}    ${descriptiontext}

click the add content
    [Arguments]    ${descriptiontext}
    Sleep    1s
    Click Element    ${add_content}
    Wait Until Element Is Visible    ${addvisionandmission}
    Page Should Contain    ${descriptiontext}
    Sleep    1s
    Click Element    xpath=//td[contains(text(),'${descriptiontext}')]//following-sibling::td//button[2]
    Wait Until Element Is Visible    ${deletebtn}
    Click Element    ${deletebtn}
    Sleep    1s
    Page Should Not Contain    ${descriptiontext}

click the search bar and enter the description
    [Arguments]    ${descriptiontext}
    Input Text    ${searchbtn}    ${descriptiontext}
    Sleep    1s

Verify the search bar
    [Arguments]    ${descriptiontext}
    Page Should Contain    ${descriptiontext}

Verify Vision Added
    [Arguments]    ${descriptiontext}
    Click the about in the menu list
    click the vision&Mission in the list
    click the add vision and Mission
    Sleep    2s
    Input Text    ${description}    ${descriptiontext}
    Sleep    1s
    Click Element    ${add_content}
    Wait Until Element Is Visible    ${addvisionandmission}
    Page Should Contain    ${descriptiontext}
    Sleep    1s
    Click Element    xpath=//td[contains(text(),'${descriptiontext}')]//following-sibling::td//button[2]
    Wait Until Element Is Visible    ${deletebtn}
    Click Element    ${deletebtn}
    Sleep    1s
    Page Should Not Contain    ${descriptiontext}

Delete the description from the table
    [Arguments]    ${descriptiontext}
    Click Element    xpath://td[contains(text(),'${descriptiontext}')]//following-sibling::td//div//child::button[2]
    Click Element    ${deletebtn}
    Sleep    2s

click the Mission in the dropdown
    Sleep    2s
    Click Element    xpath://div[contains(text(),'Vision')]
    Sleep    2s
    Click Element    ${Mission}


add the content in the vission
    Click Element    ${add_content}
    Wait Until Element Is Visible    ${addvisionandmission}
    

add the text to edit in vission
    [Arguments]    ${descriptiontext}
    Sleep    2s
    Click Element    xpath://td[contains(text(),'${descriptiontext}')]//following-sibling::td//div//child::button[1]
    Click Element    ${description}
    FOR    ${i}    IN RANGE    20
    Press Keys    ${description}    BACKSPACE
    END
    Sleep    2s
    Input Text    ${description}    ${Avengers}
    Click Element    ${submitcontent}
    Page Should Contain    ${Avengers}
    Click Element    xpath://td[contains(text(),'${Avengers}')]//following-sibling::td//div//child::button[2]
    Sleep    2s

    Click Element    ${deletebtn}  
    Sleep    2s
    Page Should Not Contain    ${Avengers}
    Sleep    2s