
Feature: Contacts Page

#Successful Scenario

        Scenario: Verify "Save Changes" button is disabled when landing on the "ContactsPage"
            Given the user navigates to the "ContactsPage"
             Then the "Save Changes" button should be disabled


        Scenario: Add a new contact with optional fields
            Given the user is on the "New Contact" page
             When the user selects "12/12/1990" as the "DateOfBirth"
              And the user selects "Female" from the "Gender" options
              And the user selects "GMT+0:00" from the "Timezone" dropdown
              And the user clicks the "Save Changes" button
             Then the "Save Changes" button should be still disabled


        Scenario: Add a new contact with only required fields
            Given the user is on the "New Contact" page
             When the user enters "John" into the "FirstName" input
              And the user enters "Smith" into the "LastName" input
              And the user enters "+971555123456" into the "PhoneNumber" input
              And the user enters "john.smith@example.com" into the "EmailAddress" input
              And the user clicks the "Save Changes" button
             Then a new contact with the name "John Smith" and the provided phone and email information should be added
              And a confirmation message should be displayed


        Scenario: Add a new contact and set the primary phone number
            Given the user is on the "New Contact" page
             When the user enters "Alice" into the "FirstName" input
              And the user enters "Johnson" into the "LastName" input
              And the user enters "+971555789123" into the "PhoneNumber" input
              And the user checks the "Make this primary" checkbox for the phone number
              And the user enters "alice.johnson@example.com" into the "EmailAddress" input
              And the user clicks the "Save Changes" button
             Then a new contact with the name "Alice Johnson" should be added with the specified primary phone number
              And a confirmation message should be displayed


        Scenario: Attempt to add five phone numbers to a new contact
            Given the user is on the "New Contact" page
             When the user enters "Emily" into the "FirstName" input
              And the user enters "Clark" into the "LastName" input
              And the user clicks the "Add Phone" button four times
              And the user enters "+971500123451" into the first "PhoneNumber" input
              And the user enters "+971500123452" into the second "PhoneNumber" input
              And the user enters "+971500123453" into the third "PhoneNumber" input
              And the user enters "+971500123454" into the fourth "PhoneNumber" input
              And the user enters "+971500123455" into the fifth "PhoneNumber" input
              And the user enters "emily.clark@example.com" into the "EmailAddress" input
              And the user clicks the "Save Changes" button
             Then the new contact with the name "Emily Clark" and five phone numbers should be added


        Scenario: Attempt to add five email addresses to a new contact
            Given the user is on the "New Contact" page
             When the user enters "Robert" into the "FirstName" input
              And the user enters "Brown" into the "LastName" input
              And the user enters "+971500123456" into the "PhoneNumber" input
              And the user clicks the "Add Email" button four times
              And the user enters "robert.brown1@example.com" into the first "EmailAddress" input
              And the user enters "robert.brown2@example.com" into the second "EmailAddress" input
              And the user enters "robert.brown3@example.com" into the third "EmailAddress" input
              And the user enters "robert.brown4@example.com" into the fourth "EmailAddress" input
              And the user enters "robert.brown5@example.com" into the fifth "EmailAddress" input
              And the user clicks the "Save Changes" button
             Then the system should validate the number of email addresses
              And the new contact with the name "Robert Brown" and five email addresses should be added

        Scenario: Add a new contact with all fields filled
            Given the user is on the "New Contact" page
             When the user enters "Laura" into the "FirstName" input
              And the user enters "Williams" into the "LastName" input
              And the user enters "+971555123789" into the "PhoneNumber" input
              And the user checks the "Make this primary" checkbox for the phone number
              And the user enters "laura.williams@example.com" into the "EmailAddress" input
              And the user selects "12/31/1985" as the "DateOfBirth"
              And the user selects "Female" from the "Gender" options
              And the user selects "Eastern Standard Time" from the "Timezone" dropdown
              And the user clicks the "Save Changes" button
             Then a new contact named "Laura Williams" should be added with all the provided information
              And a confirmation message should be displayed

        Scenario: Attempt to delete other added phone numbers in the form
            Given the user is on the "New Contact" page
              And the user has already added multiple phone numbers
             When the user clicks the delete button next to the second "PhoneNumber" input
              And the user clicks the delete button next to the third "PhoneNumber" input
             Then those phone number fields should be removed from the form
              And only the first "PhoneNumber" input should remain

        Scenario: Attempt to delete other added email addresses in the form
            Given the user is on the "New Contact" page
              And the user has already added multiple email addresses
             When the user clicks the delete button next to the second "EmailAddress" input
              And the user clicks the delete button next to the third "EmailAddress" input
             Then those email address fields should be removed from the form
              And only the first "EmailAddress" input should remain
              
        Scenario: Attempt to add contact numbers with different country codes
            Given the user is on the "New Contact" page
             When the user enters "Michael" into the "FirstName" input
              And the user enters "Robinson" into the "LastName" input
              And the user selects "+44" from the new "CountryCode" dropdown next to the "PhoneNumber" input
              And the user enters "7891234" into the "PhoneNumber" input
              And the user clicks the "Add Phone" button
              And the user selects "+91" from the new "CountryCode" dropdown next to the "PhoneNumber" input
              And the user enters "4567890" into the "PhoneNumber" input
              And the user clicks the "Save Changes" button
             Then a new contact named "Michael Robinson" should be added with the specified phone numbers, each having different country codes
              And a confirmation message should be displayed

#Negative Scenarios 


        Scenario: Attempt to add a new contact with no input data
            Given the user is on the "New Contact" page
             When the user does not enter any data into the "FirstName", "LastName", "PhoneNumber", and "EmailAddress" fields
             Then the "Save Changes" button should be disabled

        Scenario: Attempt to add a new contact with only the first name
            Given the user is on the "New Contact" page
             When the user enters "Sophia" into the "FirstName" input
              And the user does not enter any data into the "LastName", "PhoneNumber", and "EmailAddress" fields
             Then the "Save Changes" button should be disabled

        Scenario: Attempt to add a new contact with only the last name
            Given the user is on the "New Contact" page
             When the user enters "Anderson" into the "LastName" input
              And the user does not enter any data into the "FirstName", "PhoneNumber", and "EmailAddress" fields
             Then the "Save Changes" button should be disabled

        Scenario: Attempt to add a new contact with an invalid email address
            Given the user is on the "New Contact" page
             When the user enters "Tom" into the "FirstName" input
              And the user enters "Harris" into the "LastName" input
              And the user enters "+9715556789" into the "PhoneNumber" input
              And the user enters "tom.harris@invalid" into the "EmailAddress" input
             Then the error message should be displayed to enter a valid email address


        Scenario: Attempt to add a new contact with a future date of birth
            Given the user is on the "New Contact" page
             When the user enters "Emily" into the "FirstName" input
              And the user enters "Johnson" into the "LastName" input
              And the user enters "+971555123456" into the "PhoneNumber" input
              And the user enters "emily.johnson@example.com" into the "EmailAddress" input
              And the user selects a date in the future as the "DateOfBirth"
             Then the user is unable to select the future date
              And future dates should be disabled


        Scenario: Attempt to add a new contact with special characters in first name fields
            Given the user is on the "New Contact" page
             When the user enters "@!$%" into the "FirstName" input
             Then the "Save Changes" button should be disabled
              And an error message on the "First name" field should be displayed indicating that "The first name should only contain alphanumeric characters"

  
        Scenario: Attempt to add a new contact with special characters in last name fields
            Given the user is on the "New Contact" page
             When the user enters "@!$%" into the "LastName" input
             Then the "Save Changes" button should be disabled
              And an error message on the "First name" field should be displayed indicating that "The last name should only contain alphanumeric characters"


        Scenario: Attempt to add a new contact while the form has unsaved changes(click onadd new contact)
            Given the user is on the "New Contact" page
              And the user has already filled the fields
             When the user clicks on the "Add Contact" button
             Then new contact form should not open



        Scenario: Attempt to set more than one contact number as a primary contact
            Given the user is on the "New Contact" page
             When the user enters "Lisa" into the "FirstName" input
              And the user enters "Green" into the "LastName" input
              And the user clicks the "Add Phone" button
              And the user enters "+971500123456" into the first "PhoneNumber" input
              And the user checks the "Make this primary" checkbox for the first phone number
              And the user enters "+971500654321" into the second "PhoneNumber" input
              And the user checks the "Make this primary" checkbox for the second phone number
              And the user clicks the "Save Changes" button
             Then the first primary checkbox should be unchecked when the second is checked
 
        Scenario: Attempt to set more than one email address as a primary contact
            Given the user is on the "New Contact" page
             When the user enters "Mark" into the "FirstName" input
              And the user enters "Taylor" into the "LastName" input
              And the user clicks the "Add Email" button
              And the user enters "mark.taylor1@example.com" into the first "EmailAddress" input
              And the user checks the "Make this primary" checkbox for the first email address
              And the user clicks the "Add Email" button
              And the user enters "mark.taylor2@example.com" into the second "EmailAddress" input
              And the user checks the "Make this primary" checkbox for the second email address
              And the user clicks the "Save Changes" button
             Then the first primary checkbox should be unchecked when the second is checked
 

        Scenario: Attempt to add a new contact with less than three characters in first name fields
            Given the user is on the "New Contact" page
             When the user enters "Al" into the "FirstName" input
             Then error message should be displayed indicating that "the first name must contain min 3 characters"


#Character Limitation Scenarios

        Scenario: Attempt to add a new contact with less than three characters in last name fields
            Given the user is on the "New Contact" page
             When the user enters "Sd" into the "LastName" input
             Then error message should be displayed indicating that "the last name must contain min 3 characters"

        Scenario: Attempt to add a new contact with first name more than 50 characters
            Given the user is on the "New Contact" page
             When the user enters a first name with more than 50 characters into the "FirstName" input
             Then an error message should be displayed indicating that the first name must contain a maxi 50 characters
  
        Scenario: Attempt to add a new contact with last name more than 50 characters
            Given the user is on the "New Contact" page
             When the user enters a last name with more than 50 characters "adsadsasdijikalkfdadaasdasdasddasdasds7a8s7d" into the "LastName" input
             Then an error message should be displayed indicating that the "last name must contain a max 50 characters"

        Scenario: Attempt to add a new contact with excessively long phone number
            Given the user is on the "New Contact" page
             When the user enters a phone number with more than 15 digits "12345678965436722" into the "PhoneNumber" input
             Then the system should not allow the user to input more than 15 digits
              And an error message should be displayed indicating "The phone number is invalid"

        Scenario: Attempt to add a new contact with invalid email address
            Given the user is on the "New Contact" page
             When the user enters an invalid email address format into the "EmailAddress" input
             Then an error message should be displayed indicating "A valid email is required"


        Scenario: Attempt to add a new contact with invalid characters in the phone number
            Given the user is on the "New Contact" page
             When the user enters a phone number with special characters "!@#$%^&*" into the "PhoneNumber" input
             Then the system should not allow the user to input special characters in the phone number field

        Scenario: Attempt to add a new contact with a date of birth in an invalid format
            Given the user is on the "New Contact" page
             When the user enters a date of birth in an invalid format "2022-01-15" into the "DateOfBirth" input
             Then an error message should be displayed indicating "The format is incorrect (expected: DD/MM/YYYY)"

        Scenario: Attempt to add more than five phone numbers
            Given the user is on the "New Contact" page
             When the user clicks the "Add Phone" button four times
              And the user enters a valid phone number into each of the five "PhoneNumber" input fields
              And the user tries to clicks the "Add Phone" button again
             Then the "Add Phone" button should be hidden
              And the user should not be able to enter sixth phone number


        Scenario: Attempt to add more than five email addresses
            Given the user is on the "New Contact" page
             When the user clicks the "Add Email" button five times
              And the user enters a valid email address into each of the five "EmailAddress" input fields
              And the user tries to clicks the "Add Email" button again
             Then the "Add Email" button should be hidden
              And the user should not be able to enter sixth email address





 

















