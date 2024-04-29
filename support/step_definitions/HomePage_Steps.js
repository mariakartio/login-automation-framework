const { Given, When, Then } = require("@badeball/cypress-cucumber-preprocessor");



Given ('I navigated to the WebdriverUniversity homepage', () =>{
cy.visit("https://webdriveruniversity.com/")
    
})

When('I click on the contact us form', () =>{
    cy.get('#contact-us').invoke("removeAttr", "target").click();
   
})
