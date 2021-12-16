module Calculators
    def Bmi_calc (w,h)
        h = h/100
    return (w/h**2)
    
    end

    def calorie_calc (f)
        url = URI("https://edamam-food-and-grocery-database.p.rapidapi.com/parser?ingr="+f.to_s)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'edamam-food-and-grocery-database.p.rapidapi.com'
        request["x-rapidapi-key"] = 'ad3d8b64b4msh60e75cfb56f2ee7p1f7b0ajsnbfaf183acc15'
        response = http.request(request)
        jParsed =  JSON.parse(response.body)#Gets the api response and parses it
        calories=jParsed.dig("parsed",0,"food","nutrients","ENERC_KCAL")
    return calories #return the calories per item
    end    
end