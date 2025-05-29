*** Settings ***
Library    SeleniumLibrary
Documentation    Product page tests
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/ShrineResource.robot
Test Setup    Open the Browser with URL
Test Teardown    Close browser session

*** Test Cases ***
Verify the shine panel
    GenericResources.Fill the valid Login Credentials          
    ShrineResource.Click the menu in the home page
    ShrineResource.Click the about in the Menubar
    ShrineResource.Click the shrine element in the about
    ShrineResource.Verify agin it redirected into shine page

     
Validate the shrine panel element in the about 
    GenericResources.Fill the valid Login Credentials          
    ShrineResource.Click the menu in the home page
    ShrineResource.Click the about in the Menubar
    ShrineResource.Click the shrine element in the about
    ShrineResource.Click the add shrine in the shrine page
    ShrineResource.Click the back in the add shrine page
    ShrineResource.Verify agin it redirected into shine page

Fill without Uploading image credentials in the shrine 
     GenericResources.Fill the valid Login Credentials          
    ShrineResource.Click the menu in the home page
    ShrineResource.Click the about in the Menubar
    ShrineResource.Click the shrine element in the about
    ShrineResource.Click the add shrine in the shrine page
    ShrineResource.Send input to the title in the shine page
    ShrineResource.Send input to the description in the shine page
    ShrineResource.Click the Submit button in the add shrine page
    ShrineResource.Verify the Alert that image is required

Fill without entering title in the shrine
     GenericResources.Fill the valid Login Credentials          
    ShrineResource.Click the menu in the home page
    ShrineResource.Click the about in the Menubar
    ShrineResource.Click the shrine element in the about
    ShrineResource.Click the add shrine in the shrine page

Search and Assert the title in the shine panel
    GenericResources.Fill the valid Login Credentials          
    ShrineResource.Click the menu in the home page
    ShrineResource.Click the about in the Menubar
    ShrineResource.Click the shrine element in the about
    ShrineResource.Send input to the search box
    ShrineResource.Verify the title in the shine panel
    




    
     





    