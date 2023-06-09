*** Settings ***
Library    SeleniumLibrary
*** Variables ***

*** Test Cases ***
Success with Open and close E-filling
   Go to RD Service
   Click more details
   close previous tab

*** Keywords ***
 Go to RD Service
    Open Browser    https://efiling.rd.go.th/rd-cms/    chrome
    ...    remote_url=http://167.99.75.48:8080/wd/hub
    Maximize Browser Window

Click more details
    Click Element    xpath=//*[@id="announceModal"]/div/div/div[2]/div/div[2]/span/a
    ${tab1}=        Switch Window    NEW  # switch to new tab and get original tab handle 
    Capture Page Screenshot
    Sleep   3                            # do stuff in new tab
    Switch Window       ${tab1}           # switch back to original tab 
   

close previous tab
    Click Element	xpath=//*[@id="announceModal"]/div/div/div[1]/button/span
    Capture Page Screenshot
    Sleep   3
    Click Element	xpath=//*[@id="top"]/div/div[2]/button[1]/a
    ${tab2}=        Switch Window    NEW  # switch to new tab and get original tab handle 
    Capture Page Screenshot