class Coin < ApplicationRecord
  belongs_to :user
  include HTTParty
  base_uri "https://pro-api.coinmarketcap.com"


  def self.get_crypto_data(crypto_symbol)
    api_key = 'e530048e-2815-46ea-9505-d99b79a9a5e5'
    options = { query: {symbol: crypto_symbol, convert: "USD" }, headers: { 'X-CMC_PRO_API_KEY' => api_key } }
    response = get("/v1/cryptocurrency/quotes/latest", options)
    if response.success?
      JSON.parse(response.body)
    else
      raise response.response
    end
  end

end
