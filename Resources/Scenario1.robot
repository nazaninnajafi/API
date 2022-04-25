*** Settings ***
Library             RequestsLibrary
Library             JSONLibrary


*** Variables ***
${baseUrl}          https://gorest.co.in
${relativeUrl}      /public/v1/posts/123/comments
${pathPage}         $.meta.pagination.page
${pathData}         $.data


*** Keywords ***   
Validation Page
    Get JsonValue  ${pathPage}
    ${JsonValue}  Convert To String  ${responseJsonValue[0]}
    Set Global Variable     ${JsonValue}
    Should Be Equal  ${JsonValue}  1
    
Validation Data
    Get JsonValue  ${pathData}
    Should Be Empty  ${responseJsonValue[0]} 
