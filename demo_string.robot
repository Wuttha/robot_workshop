*** Settings ***
Library    String

*** Variables ***
${result}  ผลการค้นหาประมาณ 5,080,000,000 รายการ (0.30 วินาที) 

*** Test Cases ***
Try to split data
    @{words}=  Split String  ${result}  ${SPACE}  max_split=3
    log to console  ${words[0]}
    log to console  ${words[1]}
    log to console  ${words[2]}
    log to console  ${words[3]}
    Should Be Equal   ${words[0]}  ผลการค้นหาประมาณ
    Should Be Equal   ${words[2]}  รายการ

*** Keywords ***
