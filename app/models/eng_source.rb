class EngSource
  require 'httparty'
  require 'nokogiri'
  
  def self.get
    url = 'http://www.engvid.com/english-lesson-browser/'
    response = HTTParty.get  url 
    doc = Nokogiri::HTML response.body

    lessons = Array.new

    doc.css('.lessonlinks_all_row').each do |temp|
      lesson = Hash.new

      lesson[:title] = temp.at_css('.lessonlinks_all_lessontitle').text.strip
      lesson[:description] = temp.at_css('.lessonlinks_all_category_list').text.strip
      lesson[:image] = temp.at_css('img')['src']
      lesson[:url] = temp.at_css('a')['href']

      lessons.push(lesson)
    end

    lessons.reverse!
  end
end