Feature: WebdriverUniversity - Contact Us Page


        # Scenario: Valid Contact us page form submission

        #     Given I navigated to the WebdriverUniversity homepage
        #      When I click on the contact us form
        #       And I type a first name
        #       And I type a last name
        #       And I type an email address
        #       And I type a comment
        #       And I click on the submit button
        #      Then I should be presented with a succesful contact us submission message

        # Scenario: Invalid Contact us page form submission

        #     Given I navigated to the WebdriverUniversity homepage
        #      When I click on the contact us form
        #       And I type a first name
        #       And I type a last name
        #       And I type a comment
        #       And I click on the submit button
        #      Then I should be presented with a unsuccesful contact us submission message


        Scenario Outline: Valid Contact us page form submission - specific data
            Given I navigated to the WebdriverUniversity homepage
             When I click on the contact us form
              And I type a first name <FirstName>
              And I type a last name <LastName>
              And I type an email address <emailAddress>
              And I type a comment <Message> and 01 test
              And I click on the submit button
             Then I should be presented with a succesful contact us submission message

        Examples:

                  | FirstName | LastName  | emailAddress        | Message            |
                  | "Maria"   | "Kartio"  | "msjdkfj@gmail.com" | "First test data"  |
                  | "Atiya"   | "Kalhoro" | "asdas@gmail.com"   | "Second test data" |
         



        # Scenario Outline: login with Invalid credentials

        #     Given I navigated  to the Login Page
        #     When I enter the valid email address 
        #     And I enter the correct password 
        #     Then I should successfully logged in into the system 







