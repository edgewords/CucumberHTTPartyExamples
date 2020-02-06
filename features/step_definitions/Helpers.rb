class GetProduct
    include HTTParty
  
    base_uri "http://127.0.0.1:2002/api/products"
  
    def byId(id)
      self.class.get("/#{id}")
    end

    def allProducts
        self.class.get()
    end
end