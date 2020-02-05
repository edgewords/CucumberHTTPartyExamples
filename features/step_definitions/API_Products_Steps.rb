require "cucumber"
require "rspec/expectations"
require 'httparty'

# used to check all response codes:
Then("I get a {int} response code") do |code|
  expect(@response.code).to eq(code)
end

When("I GET product record number {int}") do |id|
    @response = HTTParty.get('http://127.0.0.1:2002/api/products/'+ id.to_s)
    puts @response.body
  end

Then("The product is an {string}") do |productName|
    expect(@response['name']).to eq(productName)
  end

  When("I POST a new product with {string}, {string}, {string}") do |strID, strName, strPrice|
    @response = HTTParty.post('http://127.0.0.1:2002/api/products/', 
        :body => { :id => strID, 
                   :name => strName, 
                   :price => strPrice,  
                 }.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
    puts @response.body
    puts @response.code

  end

  When("I Delete product {int}") do |intID|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When("I Update product {int} with a name of {string} and a price of {string}") do |intID, strName, strPrice|
    pending # Write code here that turns the phrase above into concrete actions
  end