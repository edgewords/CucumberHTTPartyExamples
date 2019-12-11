Feature: API Tests
   API Tests using HTTParty, against http://dummy.restapiexample.com/

Scenario: Simple GET Test
When I GET customer record number 1
Then I get a 200 response code

Scenario: Create a Customer
When I POST a new customer
Then I get a 200 response code
And I can GET the customer details

Scenario: Update a customer
Given I POST a new customer
When I update the customer details
Then I get a 200 response code
And The customer is updated