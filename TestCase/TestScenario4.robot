*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     ../Libraries/dateTime.py

Resource    ../Resources/Scenario4.robot
Resource    ../Resources/CommonFunctionality.robot


*** Test Cases ***
TestScenario4
    Update Name And Email
    Validation status_code  201
    Validation JsonValue  ${pathName}  david
    Validation JsonValue  ${pathEmail}  david@gmail.com
    Validation Id Lenth
    Convert CreatedAt
    Log to console  ${createdAt}
    