*** Settings ***
Documentation    resource file 
Library    SeleniumLibrary


*** Variables ***
${app_bar}            xpath://button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit MuiIconButton-edgeStart MuiIconButton-sizeMedium css-q6oun']
${about_element}      xpath:(//span[contains(@class,'MuiListItemText-primary')])[2]
${shrine_element}     xpath://div[@class='MuiButtonBase-root MuiListItemButton-root MuiListItemButton-gutters MuiListItemButton-root MuiListItemButton-gutters css-6poya9'][3]
${add_shrine}         xpath://button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-ssnmq7']
${add_title}          xpath://input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq']
${text_area}          xpath://textarea[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMultiline css-u36398'][1]
${back}               xpath://button[@class='MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-79xub']
${shine_panel}        xpath://h4[@class='MuiTypography-root MuiTypography-h4 css-6ubyw9']
${submit_shrine}      xpath://button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-h6pgjh']
${Image_required}     xpath://div[@class='MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation0 MuiAlert-root MuiAlert-filledError MuiAlert-filled css-u9ta6q']
# ${search_box}         xpath://div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-sizeSmall MuiInputBase-adornedStart css-2xhzvc']
${search_text}        xpaht://p[text()='Testing']
${search_box}     xpath://*[@id=":r3:"]

*** Keywords ***
Click the menu in the home page 
    Click Element     ${app_bar}
    Sleep    5s

Click the about in the Menubar
    Click Element    ${about_element}
    Sleep    5s
Click the shrine element in the about 
    Click Element    ${shrine_element}
    Sleep    5s
Click the add shrine in the shrine page
    Click Element    ${add_shrine}
    Sleep    5s
Click the back in the add shrine page
    Click Element    ${back}
    Sleep    5s
Verify agin it redirected into shine page
    Element Text Should Be    ${shine_panel}    SHINE PANEL
    Sleep    5s
Send input to the title in the shine page
    Input Text    ${add_title}    text=Testing
    Sleep    5s
Send input to the description in the shine page
    Input Text    ${text_area}    text=Testing is important step in SDLC.
    Sleep    5s
Click the Submit button in the add shrine page
    Click Element    ${submit_shrine}
    Sleep    5s
Verify the Alert that image is required
    Element Text Should Be    ${Image_required}    Image is required
    Sleep    5s
Send input to the search box
#     Click Element    xpath://*[@id="root"]/div[1]/main/div[2]/div[1]/div[1]/div/div
#     Input Text    xpath://*[@id="root"]/div[1]/main/div[2]/div[1]/div[1]/div/div    Testing
#     Sleep    5s
    Click Element    xpath://*[@id="root"]/div[1]/main/div[2]/div[1]/div[1]/div/div
    Press Keys       xpath://*[@id="root"]/div[1]/main/div[2]/div[1]/div[1]/div/div    Testing

Verify the title in the shine panel
    Page Should Contain    Testing
    Sleep    5s







    