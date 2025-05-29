*** Settings ***
Library    SeleniumLibrary
Documentation    Product page tests
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/ShineResource.robot
Test Setup    Open the Browser with URL
Test Teardown    Close browser session

*** Test Cases ***
 Verify the shine panel
     GenericResources.Fill the valid Login Credentials          
     ShineResource.Click the menu in the home page
     ShineResource.Click the about in the Menubar
     ShineResource.Click the shrine element in the about
     ShineResource.Verify agin it redirected into shine page

     
 Validate the shrine panel element in the about 
     GenericResources.Fill the valid Login Credentials          
     ShineResource.Click the menu in the home page
     ShineResource.Click the about in the Menubar
     ShineResource.Click the shrine element in the about
     ShineResource.Click the add shrine in the shrine page
     ShineResource.Click the back in the add shrine page
     ShineResource.Verify agin it redirected into shine page

 Fill without Uploading image credentials in the shrine 
      GenericResources.Fill the valid Login Credentials          
     ShineResource.Click the menu in the home page
     ShineResource.Click the about in the Menubar
     ShineResource.Click the shrine element in the about
     ShineResource.Click the add shrine in the shrine page
     ShineResource.Send input to the title in the shine page
     ShineResource.Send input to the description in the shine page
     ShineResource.Click the Submit button in the add shrine page
     ShineResource.Verify the Alert that image is required

 Fill without entering title in the shrine
      GenericResources.Fill the valid Login Credentials          
     ShineResource.Click the menu in the home page
     ShineResource.Click the about in the Menubar
     ShineResource.Click the shrine element in the about
     ShineResource.Click the add shrine in the shrine page

 Search and Assert the title in the shine panel
     GenericResources.Fill the valid Login Credentials          
     ShineResource.Click the menu in the home page
     ShineResource.Click the about in the Menubar
     ShineResource.Click the shrine element in the about
     ShineResource.Send input to the search box
     ShineResource.Verify the title in the shine panel

Add credentials in the Shrine
      GenericResources.Fill the valid Login Credentials          
     ShineResource.Click the menu in the home page
     ShineResource.Click the about in the Menubar
     ShineResource.Click the shrine element in the about
     ShineResource.Click the add shrine in the shrine page
     ShineResource.Send input to the title in the shine page
     ShineResource.Send input to the description in the shine page

Add the valid credentials in the shrine
    GenericResources.Fill the valid Login Credentials          
    ShineResource.Click the menu in the home page
    ShineResource.Click the about in the Menubar
    ShineResource.Click the shrine element in the about
    ShineResource.Click the add shrine in the shrine page
    ShineResource.Send input to the title in the shine page
    ShineResource.Send input to the description in the shine page
    ShineResource.Send input as image in shrine page
    ShineResource.Click the Submit button in the add shrine page


Edit and assert the title in the shrine page and delete
    GenericResources.Fill the valid Login Credentials          
    ShineResource.Click the menu in the home page
    ShineResource.Click the about in the Menubar
    ShineResource.Click the shrine element in the about
    ShineResource.Click edit title in the shrine page
    ShineResource.Send input to the title edit element
    ShineResource.Click the update shrine button
    ShineResource.Assert the edit title heading

Adding the shine content 
    GenericResources.Fill the valid Login Credentials
    ShineResource.Click the menu in the home page
    ShineResource.Click the about in the Menubar
    ShineResource.Click the shrine element in the about
    ShineResource.Click the add shrine in the shrine page
    ShineResource.Send input to the title in the shine page
    ShineResource.Send input as image in shrine page
    ShineResource.Click add definitions in adding shine page
    ShineResource.Send input to add title in add definitions
    ShineResource.Send input to add description in add definitions
    ShineResource.Click the Submit button in the add shrine page
    ShineResource.Click the delete icon in the shine panel
    ShineResource.Click the delete alert
     
Check and assert deleted definitions in the Shine
    GenericResources.Fill the valid Login Credentials
    ShineResource.Click the menu in the home page
    ShineResource.Click the about in the Menubar
    ShineResource.Click the shrine element in the about
    ShineResource.Click the add shrine in the shrine page
    ShineResource.Send input to the title in the shine page
    ShineResource.Send input as image in shrine page
    ShineResource.Click add definitions in adding shine page
    ShineResource.Click the delete icon in the add shine
    ShineResource.Assert the text of no definition added

    