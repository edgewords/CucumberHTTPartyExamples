require "cucumber"
require "rspec/expectations"
require 'httparty'

# the API demos site has database restrictions on using unique customer names
# so we have to generate a random one using date time stamp

When("I GET customer record number {int}") do |employeeID|
    @response = HTTParty.get('http://dummy.restapiexample.com/api/v1/employee/'+ employeeID.to_s)
  end
  
  Then("I get a 200 response code") do
    expect(@response.code).to eq(200)
  end
  
  When("I POST a new customer") do
    # create a random customer name
    @customerName = Time.now.strftime("tester_%d%m%Y%H%M%S")

    @response = HTTParty.post('http://dummy.restapiexample.com/api/v1/create', 
        :body => { :name => @customerName, 
                   :salary => '20000', 
                   :age => '25',  
                 }.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
    hashBody = JSON.parse(@response)
    @id = hashBody["id"]

  end
  
  Then("I can GET the customer details") do
    @response = HTTParty.get('http://dummy.restapiexample.com/api/v1/employee/'+ @id)
    hashBody = JSON.parse(@response)
    expect(hashBody["employee_name"]).to eq(@customerName)
  end
  
  When("I update the customer details") do
    @updatedCustomerName = Time.now.strftime("tester_%d%m%Y%H%M%S")
    @response = HTTParty.put('http://dummy.restapiexample.com/api/v1/update/' + @id, 
      :body => { :name => @updatedCustomerName, 
                 :salary => '15000', 
                 :age => '25', 
               }.to_json,
      :headers => { 'Content-Type' => 'application/json' } )
  end
  
  Then("The customer is updated") do
    @response = HTTParty.get('http://dummy.restapiexample.com/api/v1/employee/'+ @id)
    hashBody = JSON.parse(@response)
    expect(hashBody["employee_name"]).to eq(@updatedCustomerName)
  end