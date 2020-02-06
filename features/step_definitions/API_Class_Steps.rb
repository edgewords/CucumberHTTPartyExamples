require "cucumber"
require "rspec/expectations"
require 'httparty'
require_relative 'Helpers.rb'

When("I get product {int}") do |id|
    getProduct = GetProduct.new
    @response = getProduct.byId(id)
    puts @response.body
  end

Then("I get a 200 Ok response") do
    expect(@response.code).to eq(200)
  end