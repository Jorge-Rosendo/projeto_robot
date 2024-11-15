*** Settings ***
Resource    ../resource/login_keywords.resource
Suite Setup    Open Browser    browser=chrome

*** Test Cases ***
Seccessful Login 
    I navigate to the login page
    I input correct credentials
    I click on the login button
    I am able view the home page

Unseccessful Login - No credentials
    I navigate to the login page    
    I input no credentials
    I click on the login button
    I am able to see the expected error message for no credentials  

Unseccessful Login - No Username
    I navigate to the login page    
    I input only the password    
    I click on the login button
    I am able to see the expected error message for no username

Unseccessful Login - No Password
    I navigate to the login page    
    I input only the Username    
    I click on the login button
    I am able to see the expected error message for no password

Unseccessful Login - Wrong Credentials
    I navigate to the login page    
    I input wrong credentials   
    I click on the login button
    I am able to see the expected error message for wrong credentials  