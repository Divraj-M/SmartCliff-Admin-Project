*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MenuButton}    xpath://button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit MuiIconButton-edgeStart MuiIconButton-sizeMedium css-q6oun']
${AboutinMenu}    xpath://span[contains(text(),'About')]
${Vision&Mission}    //span[contains(text(),'Vision & Mission')]
${vision&MissionPannelheading}    xpath://h4[contains(text(),'Vision & Mission Panel')]
${back}    xpath://button[@class='MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-79xub']
${Mission}    xpath://li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1km1ehz']
${description}    xpath://textarea[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMultiline css-u36398' and @name='description']
${add_content}    xpath: //button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-h6pgjh']
${addvisionandmission}    xpath: //button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-1hw9j7s']
${delete the description}    xpath://td[contains(text(),'I am From Kiot')]//following-sibling::td//div//child::button[2]
${deletebtn}    xpath://button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc']
${searchbtn}    xpath://input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall MuiInputBase-inputAdornedStart css-162edyi']



*** Keywords ***
Click the about in the menu list
    # Wait Until Element Is Visible    ${MenuButton}    timeout=5s
    Sleep    2s
    Click Element    ${MenuButton}
    Sleep    2s
    Click Element    ${AboutinMenu}

click the vision&Mission in the list
    Sleep    2s
    Click Element    ${Vision&Mission}

Verify the user is successfully entered in the vision&mission page
    Element Text Should Be    ${vision&MissionPannelheading}    VISION & MISSION PANEL

click the add vision and Mission
    Sleep    2s
    Click Element    ${addvisionandmission}

Verify the back buttion
    Click Element    ${back}
    Element Should Be Visible    ${addvisionandmission}
add the Description in the textarea
    
    Input Text    ${description}    I am From Kiot

click the add content
    Click Element    ${add_content}
    Wait Until Element Is Visible    ${addvisionandmission}
    Page Should Contain    text=I am From Kiot
    Sleep    5s
    Click Element    ${delete the description}
    Wait Until Element Is Visible    ${deletebtn}
    Click Element    ${deletebtn}
    Sleep    5s
    Page Should Not Contain    text=I am From Kiot
    Sleep    5s

click the search bar and enter the description
    Input Text    ${searchbtn}    cc
    sleep    5s
Verify the search bar
    Page Should Contain    text=cc


# *** Settings ***
# Library    SeleniumLibrary
# Resource   ../Resources/GenericResources.robot

# *** Variables ***
# ${MenuButton}        xpath://button[contains(@class,'MuiIconButton-root')]
# ${AboutinMenu}       xpath://span[contains(text(),'About')]
# ${Vision&Mission}    xpath://span[contains(text(),'Vision & Mission')]
# ${vision&MissionPannelheading}    xpath://h4[contains(text(),'Vision & Mission Panel')]
# ${back}              xpath://button[text()='Back']
# ${addvisionandmission}    xpath://*[@id="root"]/div[1]/main/div[3]/div[1]/div[2]/button
# ${description}       xpath://textarea[@name='description']
# ${add_content}       xpath://button[contains(text(),'Add Content')]
# ${deletebtn}         xpath://button[contains(@class,'MuiButton-containedError')]
# ${searchbtn}         xpath://input[contains(@class,'MuiInputBase-input')]

# *** Keywords ***
# Click the about in the menu list
#     Sleep    2s
#     Click Element    ${MenuButton}
#     Click Element    ${AboutinMenu}

# click the vision&Mission in the list
#     Sleep    2s
#     Click Element    ${Vision&Mission}

# Verify the user is successfully entered in the vision&mission page
#     Element Text Should Be    ${vision&MissionPannelheading}    VISION & MISSION PANEL

# click the add vision and Mission
#     Sleep    2s
#     Click Button    ${addvisionandmission}

# Verify the back buttion
#     Click Element    ${back}
#     Element Should Be Visible    ${addvisionandmission}

# add the Description in the textarea
#     [Arguments]    ${descriptiontext}
#     Input Text    ${description}    ${descriptiontext}

# click the add content
#     [Arguments]    ${descriptiontext}
#     Sleep    2s
#     Click Element    ${add_content}
#     Wait Until Element Is Visible    ${addvisionandmission}
#     Page Should Contain    ${descriptiontext}
#     Sleep    2s
#     Click Element    xpath=//td[contains(text(),'${descriptiontext}')]//following-sibling::td//button[2]
#     Wait Until Element Is Visible    ${deletebtn}
#     Click Element    ${deletebtn}
#     Sleep    2s
#     Page Should Not Contain    ${descriptiontext}

# click the search bar and enter the description
#     [Arguments]    ${descriptiontext}
#     Input Text    ${searchbtn}    ${descriptiontext}
#     Sleep    2s

# Verify the search bar
#     [Arguments]    ${descriptiontext}
#     Page Should Contain    ${descriptiontext}

# Verify the Vision is added in the table
#     [Arguments]    ${descriptiontext}
#     GenericResources.Fill the valid Login Credentials
#     Click the about in the menu list
#     click the vision&Mission in the list
#     click the add vision and Mission
#     add the Description in the textarea    ${descriptiontext}
#     click the add content    ${descriptiontext}