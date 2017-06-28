class Scraping
  def self.generate_dummy_pins(page_num)
    agent = Mechanize.new
    page = agent.get("http://designspiration.net/popular/page/" + page_num.to_s)
    elements = page.search("a.gridItemLink")
    elements.each do |ele|
      link = "http://designspiration.net/" + ele[:href]
      save_pin(link)
    end
  end

  def self.save_pin(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at(".mediaDescription").inner_text
    image_url = page.at(".gridItemImage")[:src] if page.at(".gridItemImage")

    pin = Pin.where(title: title).first_or_initialize
    pin.remote_image_url = image_url
    pin.user_id = rand(20) + 1
    pin.description = Faker::Friends.quote
    pin.save
  end
end
