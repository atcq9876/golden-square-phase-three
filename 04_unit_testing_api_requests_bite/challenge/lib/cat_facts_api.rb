# Unit test this class.

require 'json'

class CatFacts
  def provide
    return "Cat fact: #{get_cat_fact["fact"]}"
  end

  private

  def get_cat_fact
    text_response = Net::HTTP.get(URI("https://catfact.ninja/fact"))
    return JSON.parse(text_response)
  end
end


# # Usage
# --------
# require 'net/http'
