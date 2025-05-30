*** Settings ***
Documentation       Tests for Vision & Mission functionality
Library             SeleniumLibrary
Test Setup          Open the browser with URL
Test Teardown       Close browser session
Resource            ../Resources/GenericResources.robot
Resource            ../Resources/LoginResource.robot
Resource            ../Resources/Vision_MissionResources.robot

*** Test Cases ***
Verify the user is successfully entered in Vision and Mission page
    [Tags]    Regression    Smoke
    GenericResources.Fill the valid Login Credentials
    Vision_MissionResources.Click the about in the menu list
    Vision_MissionResources.click the vision&Mission in the list
    Vision_MissionResources.Verify the user is successfully entered in the vision&mission page

Verify the Back button in Vision and Mission
    [Tags]    Regression    Smoke
    GenericResources.Fill the valid Login Credentials
    Vision_MissionResources.Click the about in the menu list
    Vision_MissionResources.click the vision&Mission in the list
    Vision_MissionResources.click the add vision and Mission
    Vision_MissionResources.Verify the back buttion

Verify the Empty Vission is added in the application
    [Tags]    Regression    Smoke
    GenericResources.Fill the valid Login Credentials
    Vision_MissionResources.Click the about in the menu list
    Vision_MissionResources.click the vision&Mission in the list
    Vision_MissionResources.click the add vision and Mission
    Vision_MissionResources.add the content
    Vision_MissionResources.Application error

Verify the page view in the vision and Mission
    [Tags]    Regression    Smoke
    GenericResources.Fill the valid Login Credentials
    Vision_MissionResources.Click the about in the menu list
    Vision_MissionResources.click the vision&Mission in the list
    Vision_MissionResources.click the drop down for page view
