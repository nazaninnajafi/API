*** Settings ***
Library  RequestsLibrary


*** Keywords ***
GetReq
    [Arguments]  ${baseUrl}  ${relativeUrl}
    Create Session  mysession   ${baseUrl} 
    ${header}  Create Dictionary  Content-type=application/json  Accept=application/json
    ${response}    GET On Session     mysession     ${relativeUrl}  headers=${header}
    Set Global Variable     ${response}
    [Return]  ${response}
    
PostReq
    [Arguments]  ${baseUrl}  ${relativeUrl}  ${body} 
    Create Session  mysession  ${base_url}
    ${header}  Create Dictionary  Content-type=application/json  Accept=application/json
    ${response}  POST On Session  mysession   ${relativeUrl}  json=${body}  headers=${header}  expected_status=anything
    Set Global Variable     ${response}
    [Return]  ${response}

Get JsonValue
    [Arguments]  ${jsonpath}  
    ${responseJsonValue}  	Get Value From Json   ${response.json()}  ${jsonpath} 
    Set Global Variable     ${responseJsonValue}
    [Return]    ${responseJsonValue} 


Validation status_code
    [Arguments]  ${num}
    ${status_code}  convert to string  ${response.status_code}
    Should Be Equal  ${status_code}  ${num}

 