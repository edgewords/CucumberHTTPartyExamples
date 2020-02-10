Feature: Users

   This requires basic auth, username edge, password, edgewords, encrypted = Authorization: Basic ZWRnZTplZGdld29yZHM=

Scenario: GET a user
    When I get user 1
    Then I get a 200 response code
    And The username is an "Bob Jones"

Scenario: Negative Auth Test
   When I GET a user without basic auth
   Then I get a 401 response code