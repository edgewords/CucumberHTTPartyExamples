Feature: API Product Tests
   API Tests using HTTParty, against http://127.0.0.1:2002/api/products/

Scenario: Simple GET Product Test
   When I GET product record number 1
   Then I get a 200 response code
   And The product is an "iPad"

Scenario Outline: Create a new Product
   When I POST a new product with "<id>", "<name>", "<price>"
   Then I get a 201 response code
      Examples:
         | id  | name      | price  |
         | 8   | pendrive  | 30     |
         | 9   | usb cable | 10     |

Scenario: Delete a Product
   When I Delete product 2
   Then I get a 200 response code

Scenario: Update a Product
   When I Update product 1 with a name of "USB Headset" and a price of "50"
   Then I get a 200 response code
   And Product 1 is now a "USB Headset"