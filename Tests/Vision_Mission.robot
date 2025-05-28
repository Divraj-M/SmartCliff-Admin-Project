*** Settings ***
Documentation    Tests to vision&Mission
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/Vision_MissionResources.robot
Library    DataDriver    file=../Utilities/VisionandMission.xlsx    sheet_name=Sheet1

*** Test Cases ***
Verify the user is successfully entered in vision and Mission page
    GenericResources.Fill the valid Login Credentials
    Vision_MissionResources.Click the about in the menu list
    Vision_MissionResources.click the vision&Mission in the list
    Vision_MissionResources.Verify the user is successfully entered in the vision&mission page

Verify the Back buttion in Mission and Vission
    GenericResources.Fill the valid Login Credentials
    Vision_MissionResources.Click the about in the menu list
    Vision_MissionResources.click the vision&Mission in the list
    Vision_MissionResources.click the add vision and Mission
    Vision_MissionResources.Verify the back buttion

Verify the Vision is added in the table
    GenericResources.Fill the valid Login Credentials
    Vision_MissionResources.Click the about in the menu list
    Vision_MissionResources.click the vision&Mission in the list
    Vision_MissionResources.click the add vision and Mission
    Vision_MissionResources.add the Description in the textarea
    Vision_MissionResources.click the add content


Verify the search button in vision and Mission
    
    GenericResources.Fill the valid Login Credentials
    Vision_MissionResources.Click the about in the menu list
    Vision_MissionResources.click the vision&Mission in the list
    Vision_MissionResources.click the search bar and enter the description    
    Vision_MissionResources.Verify the search bar

# *** Settings ***
# Documentation       Tests for Vision & Mission functionality
# Library             SeleniumLibrary
# Library             DataDriver    file=C://Users//Lenovo//Desktop//SmartCliff-Admin//Utilities//VisionandMission.xlsx    sheet_name=Sheet1    test_case_filter=dd
# Test Setup          Open the browser with URL
# Test Teardown       Close browser session
# Resource            ../Resources/GenericResources.robot
# Resource            ../Resources/LoginResource.robot
# Resource            ../Resources/Vision_MissionResources.robot
# Test Template       Verify the Vision is added in the table

# *** Variables ***
# ${descriptiontext}


# *** Test Cases ***

# # Verify the user is successfully entered in Vision and Mission page
# #     GenericResources.Fill the valid Login Credentials
# #     Vision_MissionResources.Click the about in the menu list
# #     Vision_MissionResources.click the vision&Mission in the list
# #     Vision_MissionResources.Verify the user is successfully entered in the vision&mission page

# # Verify the Back button in Vision and Mission
# #     GenericResources.Fill the valid Login Credentials
# #     Vision_MissionResources.Click the about in the menu list
# #     Vision_MissionResources.click the vision&Mission in the list
# #     Vision_MissionResources.click the add vision and Mission
# #     Vision_MissionResources.Verify the back buttion

# Verify the Vision is added in the table    ${descriptiontext}


# # Verify the search button in Vision and Mission
# #     GenericResources.Fill the valid Login Credentials
# #     Vision_MissionResources.Click the about in the menu list
# #     Vision_MissionResources.click the vision&Mission in the list
# #     Vision_MissionResources.click the search bar and enter the description
# #     Vision_MissionResources.Verify the search bar

    
# *** Keywords ***
# Verify the Vision is added in the table
#     [Arguments]    ${descriptiontext}
#     GenericResources.Fill the valid Login Credentials
#     Click the about in the menu list
#     click the vision&Mission in the list
#     click the add vision and Mission
#     add the Description in the textarea    ${descriptiontext}
#     click the add content    ${descriptiontext}