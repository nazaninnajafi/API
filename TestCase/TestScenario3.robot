*** Settings ***
Library     RequestsLibrary

Resource    ../Resources/Scenario3.robot
Resource    ../Resources/CommonFunctionality.robot

*** Test Cases ***
TestScenario3
    post Request
    Validation status_code  400