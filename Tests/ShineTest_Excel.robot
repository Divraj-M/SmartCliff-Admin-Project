*** Settings ***
Documentation       Test for Shine functionality
Library             SeleniumLibrary
Library             DataDriver    file=../Utilities/Shineform.xlsx    sheet_name=Sheet1
Test Setup          Open the browser with URL
Test Teardown       Close browser session
Resource            ../Resources/GenericResources.robot
Resource            ../Resources/ShineResource.robot

*** Variables ***
${title}	
${description}

*** Test Cases ***
Verify the Shine
    [Tags]    Regression
    [Template]    Crud operation in Shine
    ${title}	${description}

*** Keywords ***
Crud operation in Shine
    [Arguments]    ${title}    ${description}
    IF    '${title}'=="Testing"
        GenericResources.Fill the valid Login Credentials          
        ShineResource.Click the menu in the home page
        ShineResource.Click the about in the Menubar
        ShineResource.Click the shrine element in the about
        ShineResource.Click the add shrine in the shrine page
        ShineResource.Send input to the title in the shine page    ${title}  
        ShineResource.Send input to the description in the shine page    ${description}
        ShineResource.Click the Submit button in the add shrine page
        ShineResource.Verify the Alert that image is required
    ELSE IF  '${title}'=="Tester"
         GenericResources.Fill the valid Login Credentials          
        ShineResource.Click the menu in the home page
        ShineResource.Click the about in the Menubar
         ShineResource.Click the shrine element in the about
         ShineResource.Click the add shrine in the shrine page
         ShineResource.Send input to the title in the shine page    ${title}   
         ShineResource.Send input to the description in the shine page    ${description}
    ELSE IF    '${title}'=="Resources"   
        GenericResources.Fill the valid Login Credentials          
        ShineResource.Click the menu in the home page
        ShineResource.Click the about in the Menubar
        ShineResource.Click the shrine element in the about
        ShineResource.Click the add shrine in the shrine page
        ShineResource.Send input to the title in the shine page    ${title}   
        ShineResource.Send input to the description in the shine page    ${description}
        ShineResource.Send input as image in shrine page
        ShineResource.Click the Submit button in the add shrine page
    ELSE IF    '${title}'=="Testings"
        GenericResources.Fill the valid Login Credentials
        ShineResource.Click the menu in the home page
        ShineResource.Click the about in the Menubar
        ShineResource.Click the shrine element in the about
        ShineResource.Click the add shrine in the shrine page
        ShineResource.Send input to the title in the shine page    ${title}    
        ShineResource.Send input as image in shrine page
        ShineResource.Click add definitions in adding shine page
        ShineResource.Send input to add title in add definitions
        ShineResource.Send input to add description in add definitions
        ShineResource.Click the Submit button in the add shrine page
        ShineResource.Click the delete icon in the shine panel
        ShineResource.Click the delete alert   
    ELSE IF    '${title}'=="Automation"
          GenericResources.Fill the valid Login Credentials
        ShineResource.Click the menu in the home page
        ShineResource.Click the about in the Menubar
        ShineResource.Click the shrine element in the about
        ShineResource.Click the add shrine in the shrine page
        ShineResource.Send input to the title in the shine page    ${title}
        ShineResource.Send input as image in shrine page
        ShineResource.Click add definitions in adding shine page
        ShineResource.Click the delete icon in the add shine
        ShineResource.Assert the text of no definition added

    END

    
            
    
    