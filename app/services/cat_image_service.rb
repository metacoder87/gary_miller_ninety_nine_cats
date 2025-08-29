require 'httparty'

class CatImageService
  BASE_URL = 'https://api.thecatapi.com/v1/images/search'
  API_KEY = ENV['CATS_API_KEY']

  def self.fetch_random_cute_cat_image_url
    options = {
      headers: { 'x-api-key' => API_KEY },
      query: {
        limit: 1,          # One image
        order: 'RANDOM',   # Truly random
        mime_types: 'jpg,png',  # Static images only
        category_ids: 5,   # Cats in clothes (cute); try 1 for hats, 4 for space, or remove for general
        size: 'med'        # Medium size for faster loading
      }
    }
    response = HTTParty.get(BASE_URL, options)
    if response.success? && response.parsed_response.is_a?(Array) && response.parsed_response.first
      response.parsed_response.first['url']
    else
      Rails.logger.error "Failed to fetch cat image: #{response.code} - #{response.message}"
      'https://cdn2.thecatapi.com/images/default_cat.jpg'  # Fallback URL (replace with your default)
    end
  end
end