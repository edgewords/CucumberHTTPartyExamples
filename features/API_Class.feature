Feature: Utilising Helper Class Example

   Utilises Helpers.rb::GetProduct Class

Scenario: Get a Product with GetProduct
   When I get product 1
   Then I get a 200 Ok response