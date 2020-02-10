class GetProduct
    include HTTParty
    format :json
    # If you need authentication:
    # basic_auth 'username', 'password'
  
    base_uri "http://localhost:2002/api/products"
  
    def byId(id)
      self.class.get("/#{id}")
    end

    def allProducts
        self.class.get()
    end
end