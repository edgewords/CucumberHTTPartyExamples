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

  When("I POST a new product with {string}, {string}") do |strName, strPrice|
    @response = HTTParty.post('http://127.0.0.1:2002/api/products/', 
        :body => { :name => strName, 
                   :price => strPrice,  
                 }.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
    puts @response.body
    puts @response.code

  end

  When("I Delete product {int}") do |intID|
    @response = HTTParty.delete('http://127.0.0.1:2002/api/products/'+ intID.to_s)
  end
  
  Given ("That I have just created a new product with name {string} and price of {string}") do |strName, strPrice|
    @response = HTTParty.post('http://127.0.0.1:2002/api/products/', 
      :body => { :name => strName, 
                 :price => strPrice,  
               }.to_json,
      :headers => { 'Content-Type' => 'application/json' } )
      # Now capture the dynamically created ID for the new product
      # So we can update it later
      @updatedID = @response['id']
  end

  When("I Update that product with a name of {string} and a price of {string}") do |strName, strPrice|
    @response = HTTParty.put('http://127.0.0.1:2002/api/products/' + @updatedID.to_s, 
      :body => { :name => strName, 
                 :price => strPrice,  
               }.to_json,
      :headers => { 'Content-Type' => 'application/json' } )
  puts @response.body
  puts @response.code
  end

  Then("that Product is now a {string}") do |strName|
    @response = HTTParty.get('http://127.0.0.1:2002/api/products/'+ @updatedID.to_s)
    expect(@response['name']).to eq(strName)
  end

  When("I GET a product that does not exist") do
    @response = HTTParty.get('http://127.0.0.1:2002/api/products/999999')
  end