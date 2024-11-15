*** Settings ***
Library    SeleniumLibrary
Library    ../.projeto_robot/Lib/site-packages/robot/libraries/Collections.py
Variables    ../variables/variables.py

*** Keywords ***
I navigate to the login page
    [Arguments]    ${URL}
    Go To    ${URL}

I input correct credentials
    Wait Until Element Is Visible    id=user-name   
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]}    

I input wrong credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["wrongData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["wrongData"]["password"]}         

I input only the Username    
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}

I input only the password
    Wait Until Element Is Visible    id=user-name
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]} 

I input no credentials
    Wait Until Element Is Visible    id=user-name

I click on the login button
    Click Button    id=login-button

I am able view the home page
    ${location}    Get Location
    Wait Until Element Is Visible    class=header_secondary_container
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html

I am able to see the expected error message for no credentials
    ${error_message}    Get From Dictionary    ${ERROR_MESSAGES}    noCredentials
    Wait Until Element Contains    class=error-message-container    ${error_message}
I am able to see the expected error message for no username
    ${error_message}    Get From Dictionary    ${ERROR_MESSAGES}    noUsername
    Wait Until Element Contains    class=error-message-container    ${error_message}

I am able to see the expected error message for no password
    ${error_message}    Get From Dictionary    ${ERROR_MESSAGES}    noPassword
    Wait Until Element Contains    class=error-message-container    ${error_message}
    
I am able to see the expected error message for wrong credentials
    ${error_message}    Get From Dictionary    ${ERROR_MESSAGES}    wrongCredentials
    Wait Until Element Contains    class=error-message-container    ${error_message}