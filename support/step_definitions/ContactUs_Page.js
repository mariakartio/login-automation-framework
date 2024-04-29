const { When, Then } = require("@badeball/cypress-cucumber-preprocessor");


// When ('I type a first name', ()=>{
//     cy.get('[name="first_name"]').type("Maria")


// })

// When ('I type a last name', () =>{
//     cy.get('[name="last_name"]').type("Kartio")

// })

// When ('I type an email address', () =>{
//     cy.get('[name="email"]').type("mariakartio@example.com")

// })

// When('I type a comment', () =>{
//     cy.get('textarea[name="message"]').type("This is an automated script")
// })

When ('I click on the submit button', () =>{
cy.get('[type="submit"]').click()

})
Then('I should be presented with a succesful contact us submission message', () =>{
    cy.get('h1').should('have.text', 'Thank You for your Message!');

})

Then('I should be presented with a unsuccesful contact us submission message', () =>{
    cy.get('body').contains('Invalid email address');

})


When('I type a first name {string}', (firstName) =>{
    cy.get('[name="first_name"]').type(firstName)


})


When('I type a last name {string}', (lastName) =>{
    cy.get('[name="last_name"]').type(lastName)


})

When('I type an email address {string}', (emailAddress) =>{
    cy.get('[name="email"]').type(emailAddress)

})


When('I type a comment {string} and {int} test', (message) =>{
    cy.get('textarea[name="message"]').type(message)

})

