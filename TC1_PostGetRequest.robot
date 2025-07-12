*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary

*** Variables ***
${BASE_URL}       https://gorest.co.in/public/v2/
${AUTH_TOKEN}     d6588d8c51f91e6ce0361179d3d5ea5e8b8c2696317856f92a847185190a4f5f
${ENDPOINT}       /users
${GENDER}         male
${STATUS}         inactive

*** Test Cases ***
Create New User Entry
    ${headers}        Create Dictionary    Authorization=Bearer ${AUTH_TOKEN}    Content-Type=application/json
    ${random_number}  Evaluate  str(int(time.time() * 1000))   #creating random name
    ${NAME}           Set Variable    Mike${random_number}
    ${EMAIL}          Set Variable    ${NAME}@gorest.com
    ${body}           Create Dictionary    name=${NAME}    gender=${GENDER}    email=${EMAIL}    status=${STATUS}
    ${json_body}      Evaluate    json.dumps(${body})
    Create Session    api    ${BASE_URL}    headers=${headers}
    ${response}       POST On Session  api  ${ENDPOINT}   data=${json_body}
    Should Be Equal As Strings    ${response.status_code}    201
    Log    ${response.content}
    ${id}     Set Variable    ${response.json()['id']}
    ${is_digit}  Evaluate    str(${id}).isdigit()
    Should Be True    ${is_digit}

Verify User Status
     ${headers}        Create Dictionary    Authorization=Bearer ${AUTH_TOKEN}    Content-Type=application/json
     Create Session    api    ${BASE_URL}    headers=${headers}
     ${response}       GET On Session   api  ${ENDPOINT}
     ${user_status}    Set Variable   ${response.json()[0]['status']}
     Should Be True    '${user_status}' == 'active' or '${user_status}' == 'inactive'
     Log   ${response.status_code}
     Log   ${response.content}