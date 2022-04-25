*** Settings ***
Library            RequestsLibrary


*** Variables ***
${base_url}        https://reqres.in
${relativeUrl}     /api/register


*** Keywords ***
post Request
    ${body}  Create Dictionary  email=sydney@fife
    PostReq  ${base_url}  ${relativeUrl}  ${body}
