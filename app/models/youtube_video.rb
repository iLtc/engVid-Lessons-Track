class YoutubeVideo
  require 'httparty'
  
  def self.get id
    url = 'https://www.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails&key=' + Config.get('google_api_key') + '&id=' + id
    response = HTTParty.get url 
    
    tmp = JSON.parse response.body
    snippet = tmp['items'][0]['snippet']
    contentDetails = tmp['items'][0]['contentDetails']
    
    data = Hash.new
    
    data[:title] = snippet['title']
    data[:description] = snippet['description']
    data[:thumbnail] = snippet['thumbnails']['maxres']['url']
    data[:duration] = contentDetails['duration']
    data[:definition] = contentDetails['definition']
    
    return data
  end
end