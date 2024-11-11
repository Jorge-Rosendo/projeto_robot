*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/login_keywords.resource
Test Setup    Open Browser    browser=chrome


*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce    

*** Test Cases ***
Seccessful Login 
    I navigate to the login page    ${URL}
    I input correct credentials    ${USERNAME}    ${PASSWORD}
    I click on the login button
    I am able view the home page

Unseccessful Login - No credentials
    I navigate to the login page    ${URL}
    I input no credentials
    I click on the login button
    I am able to see the expected error message    Epic sadface: Username is required

Unseccessful Login - No Username
    I navigate to the login page    ${URL}
    I input only the password    ${PASSWORD}
    I click on the login button
    I am able to see the expected error message    Epic sadface: Username is required

Unseccessful Login - No Password
    I navigate to the login page    ${URL}
    I input only the Username    ${USERNAME}
    I click on the login button
    I am able to see the expected error message    Epic sadface: Password is required

Unseccessful Login - Wrong Credentials
    I navigate to the login page    ${URL}
    I input wrong credentials    test    test
    I click on the login button
    I am able to see the expected error message    Epic sadface: Username and password do not match any user in this service