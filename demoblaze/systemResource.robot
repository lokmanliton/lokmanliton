*** Settings ***
Library    Selenium2Library
Library    OperatingSystem



*** Keywords ***
Launch Application
    [Arguments]    ${url}    ${initLoc}
    Open Browser    ${url}    chrome
    Wait Until Element Is Visible    ${initLoc}    40
    Maximize Browser Window
    