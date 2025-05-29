*** Settings ***
Documentation       Tests for Vision & Mission functionality
Library             SeleniumLibrary
Library             DataDriver    file=../Utilities/VisionandMission.xlsx    sheet_name=Sheet1
Test Setup          Open the browser with URL
Test Teardown       Close browser session
Resource            ../Resources/GenericResources.robot
Resource            ../Resources/LoginResource.robot
Resource            ../Resources/Vision_MissionResources.robot


*** Variables ***
${descriptiontext}  

*** Test Cases ***
Verify the Vision and Mission
    [Template]    Crud operation in Vission and Mission
    ${descriptiontext} 




*** Keywords ***
Crud operation in Vission and Mission
    [Arguments]    ${descriptiontext}   
    IF    '${descriptiontext}'=="Welcome to the smartcliff"
        GenericResources.Fill the valid Login Credentials
        Vision_MissionResources.Verify Vision Added    ${descriptiontext}
    ELSE IF    '${descriptiontext}'=="Welcome to the Kiot"
        GenericResources.Fill the valid Login Credentials
        Vision_MissionResources.Click the about in the menu list
        Vision_MissionResources.click the vision&Mission in the list
        Vision_MissionResources.click the add vision and Mission
        Vision_MissionResources.click the Mission in the dropdown
        Vision_MissionResources.add the Description in the textarea    ${descriptiontext}
        Vision_MissionResources.click the add content    ${descriptiontext}
    ELSE IF    '${descriptiontext}'=="IronMan"
        GenericResources.Fill the valid Login Credentials
        Vision_MissionResources.Click the about in the menu list
        Vision_MissionResources.click the vision&Mission in the list
        Vision_MissionResources.click the add vision and Mission
        Vision_MissionResources.add the Description in the textarea    ${descriptiontext}
        Vision_MissionResources.add the content in the vission
        Vision_MissionResources.click the search bar and enter the description    ${descriptiontext}  
        Vision_MissionResources.Verify the search bar    ${descriptiontext}
        Vision_MissionResources.Delete the description from the table    ${descriptiontext}
    ELSE IF    '${descriptiontext}'=="Batman"
        GenericResources.Fill the valid Login Credentials
        Vision_MissionResources.Click the about in the menu list
        Vision_MissionResources.click the vision&Mission in the list
        Vision_MissionResources.click the add vision and Mission
        Vision_MissionResources.click the Mission in the dropdown
        Vision_MissionResources.add the Description in the textarea    ${descriptiontext}
        Vision_MissionResources.add the content in the vission
        Vision_MissionResources.add the text to edit in vission    ${descriptiontext}
    END


