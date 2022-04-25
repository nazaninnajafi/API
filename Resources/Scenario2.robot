*** Settings ***
Library            RequestsLibrary
Library            JSONLibrary


*** Variables ***
${base_url}         https://reqres.in
${relativeUrl}      /api/users
${pathName}         $.name
${pathJob}          $.job


*** Keywords ***
POST Request
    ${body}  Create Dictionary  name=morpheus  job=leader
    PostReq  ${baseUrl }  ${relativeUrl}  ${body}

Validation Name
    ${valueOfName}   Get JsonValue  ${pathName}
    Set Global Variable     ${valueOfName}
    Should Be Equal  ${valueOfName[0]}  morpheus

Validation Job
    ${valueOfJob}   Get JsonValue  ${pathJob}
    Set Global Variable     ${valueOfJob}
    Should Be Equal  ${valueOfJob[0]}  leader