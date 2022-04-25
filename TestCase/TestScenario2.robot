*** Settings ***
Library     RequestsLibrary

Resource    ../Resources/Scenario2.robot
Resource    ../Resources/CommonFunctionality.robot


*** Test Cases ***
TestScenario2
    POST Request
    Validation status_code  201
    Validation Name
    Validation Job
