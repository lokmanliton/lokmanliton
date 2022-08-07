*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    String

*** Variables ***
${uname}    Lokman
@{expCate}    Phones    Laptops    Monitors


*** Keywords ***
Generate Unique Username
    ${number}    Get Time    epoch
    ${validUname}   Catenate    ${uname}+${number}
    Set Suite Variable    ${validUname}

Sign Up in Blazedemo
    [Arguments]    ${expMsg}   
    Click Element    id=signin2
    Wait Until Element Is Visible    id=sign-username
    Input Text    id=sign-username    ${validUname}
    Input Text    id=sign-password    qaz3698
    Click Element    //*[@id="signInModal"]//*[@class="btn btn-primary"]
    ${actMsg}    Handle Alert
    Should Be Equal As Strings    ${expMsg}    ${actMsg}
    Sleep    5s
    Run Keyword And Ignore Error    Click Element    //*[@id="signInModal"]//*[@class="btn btn-secondary"]
    Sleep    2s

Login in Blazedemo
    [Arguments]    ${useName}  
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername
    Input Text    id=loginusername    ${useName}
    Input Text    id=loginpassword    qaz3698
    Click Element    //*[@id="logInModal"]//*[@class="btn btn-primary"]

Verify Login
    Wait Until Element Is Visible    id=nameofuser    10
    ${actUname}    Get Text    id=nameofuser
    Should Contain    ${actUname}    ${validUname}    

Verify Login for Invalid
    Sleep    2s
    ${actErr}    Handle Alert
    Should Be Equal As Strings    ${actErr}    User does not exist.
    Click Element    //*[@id="logInModal"]//*[@class="btn btn-secondary"]
    Sleep    2s

Check Categories
    ${cateCount}    Get Element Count    //*[@id="contcont"]//*[@id="itemc"]
    Should Be Equal As Integers    ${cateCount}    3
    FOR    ${index}    ${element}    IN ENUMERATE    @{expCate}
        ${i}=    Evaluate    ${index}+1
        ${actCat}    Get Text    //*[@id="contcont"]//*[@id="itemc"][${i}]
        Should Be Equal As Strings    ${element}    ${actCat} 
        
    END

Navigate to Categories
    [Arguments]    ${catLoc}    ${expNum}    
    Click Element    ${catLoc}
    ${numMob}    Get Element Count    //*[@id="tbodyid"]/div//a[@class="hrefch"]
    Should Be Equal As Integers    ${numMob}    ${expNum}

Append Item Name in Excel
    Create File    data2.xls
    Append To File    data2.xls    Lokman\n
    Append To File    data2.xls    Lokman\n
    