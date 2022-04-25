*** Settings ***
Library     RequestsLibrary

Resource    ../Resources/Scenario1.robot
Resource    ../Resources/CommonFunctionality.robot


*** Test Cases ***
TestScenario1
    GetReq  ${baseUrl}   ${relativeUrl}
    Validation status_code  200  
    Validation Page
    Validation Data
