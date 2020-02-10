require "cucumber"
require "rspec/expectations"
require 'httparty'

# set the basic auth values for the module:
$auth = {:username => "edge", :password => "edgewords"}

When("I get user {int}") do |userID|
    @response = HTTParty.get('http://localhost:2002/api/users/' + userID.to_s, 
        :basic_auth => $auth )
    puts @response.body
  end
  
  Then("The username is an {string}") do |username|
    expect(@response['userName']).to eq(username)
  end

  #negative test (without auth)
  When("I GET a user without basic auth") do
    @response = HTTParty.get('http://localhost:2002/api/users/')
    puts @response.code
  end