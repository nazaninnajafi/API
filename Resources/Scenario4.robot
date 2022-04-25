*** Settings ***
Library             RequestsLibrary
Library             JSONLibrary
Library             ../Libraries/dateTime.py


*** Variables ***
${base_url}         https://reqres.in
${relativeUrl}      /api/users
${pathName}         $.name
${pathEmail}        $.email
${pathId}           $.id
${pathCreatedAt}    $.createdAt
${filePath}         ${CURDIR}/JsonFile/SampleJsonFile.json


*** Keywords ***
Post Request Scenario4
    ${body}  Create Dictionary  email=morpheus@gmail.com  name=morpheus  job=leader
    PostReq  ${base_url}  ${relativeUrl}  ${body}

Update Name And Email
    ${body}  Load JSON From File  ${filePath}
    # ${body}  Create Dictionary  email=morpheus@gmail.com  name=morpheus  job=leader
    ${body}  Update Value To Json  ${body}  $.name  david
    ${body}  Update Value To Json  ${body}  $.email  david@gmail.com
    PostReq  ${base_url}  ${relativeUrl}  ${body}
    Log To Console  ${response.content}
    [Return]  ${response}

Validation JsonValue
    [Arguments]  ${jsonpath}  ${Value}
    Get JsonValue  ${jsonpath}
    Should Be Equal  ${responseJsonValue[0]}  ${Value}

Validation Id Lenth
    ${id}  Get JsonValue  ${pathId}
    Length Should Be  ${id[0]}  3

Convert CreatedAt
    ${ValueOfcreatedAt}  Get JsonValue  ${pathCreatedAt}
    ${createdAt}  jdatetime  ${ValueOfcreatedAt[0]}
    Set Global Variable  ${createdAt}
    [Return]  ${createdAt}

