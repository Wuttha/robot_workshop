*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}    chrome
${URL}    https://www.google.com/
${KEYWORD}    hello
${result}  ผลการค้นหาประมาณ 5,080,000,000 รายการ (0.30 วินาที) 

*** Test Cases ***
Success with search in google with keyword=hello
   Go to google.com
   Search with keyword=hello
   Found result with keyword=hello

*** Keywords ***
Go to google.com
   Open Browser    chrome://settings/    browser=${BROWSER}
   ...    remote_url=http://167.99.75.48:8080/wd/hub
   Go to    ${URL}
   Maximize Browser Window

Search with keyword=hello
   Input Text    name:q    hello
   Press Keys    name:q    ENTER

Found result with keyword=hello
   wait Until Page Contains  helloxxxxxx
   ${result}  Get Text    xpath://div[@id="result-stats"]
   @{words}=  Split String  ${result}  ${SPACE}  max_split=3
   log to console  ${words[0]}
   log to console  ${words[1]}
   log to console  ${words[2]}
   log to console  ${words[3]}
   Should Be Equal   ${words[0]}  ผลการค้นหาประมาณ
   Should Be Equal   ${words[2]}  รายการ
   Should Start With   ${words[3]}  (
   Should End With   ${words[3]}  )${SPACE}