*** Settings ***
Resource    blazeResources.robot
Resource    systemResource.robot
Suite Setup    Launch Application    https://www.demoblaze.com/index.html    //*[@class="carousel-item active"]
Suite Teardown    Close All Browsers


*** Test Cases ***
Sign Up to blazedemo
    [Setup]    Generate Unique Username
    Sign Up in Blazedemo    Sign up successful.
    
Sign Up With Existing User
    Sign Up in Blazedemo    This user already exist.

Login Check with Invalid Credential
    Login in Blazedemo    testlokman11
    Verify Login for Invalid
    
Login with valid Credential
    Login in Blazedemo    ${validUname}
    Verify Login

Available Categories
    Check Categories
Product List for Mobile
    Capture Page Screenshot
Product List for Laptop
    Capture Page Screenshot
Product List for Desktop
    Capture Page Screenshot
Viewing Product detail
    Capture Page Screenshot
Add to Cart
    Capture Page Screenshot
View Cart
    Capture Page Screenshot
Checkout and place order
    Capture Page Screenshot
View order
    Capture Page Screenshot
Logout
    Capture Page Screenshot

Excel File MgmtTesting
    Append Item Name in Excel
