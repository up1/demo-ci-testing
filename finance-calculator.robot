*** Settings ***
Library   SeleniumLibrary
Test Teardown   Close Browser

*** Variable ***
${BASE_URL}    https://www.mitsubishi-motors.co.th/en

*** Test Cases ***
Finance caclculator of New Mitsubishi Pajero Sport
    Open Finance calculator page
    Choose New Mitsubishi Pajero Sport
    Choose model GT-Premium 2WD 1,469,000 
    Choose down payment 500,000
    Choose installment period 60 month
    Choose interest rate 2.5%
    Check result calculation 

*** Keywords ***
Choose New Mitsubishi Pajero Sport
    Scroll Element Into View   xpath:/html/body/div/main/div[3]/div/div[2]/div/div/div[1]/div[1]
    Wait Until Element Is Visible    xpath://div[2]/div/div/div[1]/div[1]/a
    Click Element   xpath://div[2]/div/div/div[1]/div[1]/a

Open Finance calculator page
    Open Browser    ${BASE_URL}    browser=chrome
    Maximize Browser Window
    Add Cookie   cookieConsent   true   domain=www.mitsubishi-motors.co.th
    Go To   ${BASE_URL}/buy/finance-calculator

Choose model GT-Premium 2WD 1,469,000
    Wait Until Element Is Visible   xpath:/html/body/div/main/div[2]/iframe
    Select Frame   xpath:/html/body/div/main/div[2]/iframe
    Wait Until Element Is Visible   id:ctrl_model
    Select From List By Value  id:ctrl_model  1469000

Choose down payment 500,000
    Input Text  id:ctrl_down_payment   500000

Choose installment period 60 month
    Wait Until Element Is Visible   xpath://*[@id="frm_calculator"]/div[3]/div/ul/li[2]
    Click Element  xpath://*[@id="frm_calculator"]/div[3]/div/ul/li[2]

Choose interest rate 2.5%
    Input Text  id:ctrl_interest   3.0

Check result calculation
    Click Element   id:ctrl_submit
    Wait Until Element Contains   id:text_result_h4   The Result or Calculation   
    Wait Until Element Contains   id:txt_price   1,469,000
    Wait Until Element Contains   id:txt_down   500,000
    Wait Until Element Contains   id:txt_loan   969,000
    Wait Until Element Contains   id:txt_interest   145,350
    Wait Until Element Contains   id:txt_installment   18,573   

