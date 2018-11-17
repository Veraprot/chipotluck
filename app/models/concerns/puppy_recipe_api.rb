module PuppyRecipeApi
  BASE_URL = 'http://www.recipepuppy.com/api/'

  def self.query(user_query_params)
    query =  "#{BASE_URL}"
    search_format = "?q=#{user_query_params.gsub(' ', '%20')}"
    response_thing = RestClient.get(query+search_format)
    parsed_response = JSON.parse(response_thing)

    results = parsed_response["results"]
  end 
end 