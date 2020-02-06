Feature: API Product Tests
   API Tests using HTTParty, against http://127.0.0.1:2002/api/products/

Scenario: Simple GET Product Test
   When I GET product record number 1
   Then I get a 200 response code
   And The product is an "iPad"

Scenario Outline: Create a new Product
   When I POST a new product with "<name>", "<price>"
   Then I get a 201 response code
      Examples:
         | name      | price  |
         | pendrive  | 30     |
         | usb cable | 10     |

Scenario: Update a Product
   Given That I have just created a new product with name "mouse" and price of "5"
   When I Update that product with a name of "USB Headset" and a price of "50"
   Then I get a 200 response code
   And that Product is now a "USB Headset"

Scenario: Delete a Product
   When I Delete product 3
   Then I get a 200 response code

Scenario: Negative Test
   When I GET a product that does not exist
   Then I get a 404 response code
