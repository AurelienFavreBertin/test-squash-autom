*** Settings ***
Documentation     Test authentification using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${URL}           https://www.amazon.fr
${BROWSER}       FireFox
${LOGIN}         aurelien69fb@gmail.com
${PASSWORD}      azerty
${USERNAME}      Aurelien

*** Test Cases ***
Valid Login
    Open Browser To Home Page
    Accept Cookie
    Click To Login Page
    Send Login
    Click To Continue
    Send Password
    Click To Submit
    Check UserName
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${URL}    ${BROWSER}

Accept Cookie
    Wait Until Element Is Visible    sp-cc-accept
    Click Element   sp-cc-accept
Click To Login Page
    Wait Until Element Is Visible    nav-link-accountList-nav-line-1
    Click Element    nav-link-accountList-nav-line-1

Send Login
    Input Text    email    ${LOGIN}

Click To Continue
    Click Element    continue

Send Password
    Input Password    password    ${PASSWORD}

Click To Submit
    Click Element    signInSubmit

Check UserName
    Element Should Contain    nav-link-accountList-nav-line-1    ${USERNAME}

    