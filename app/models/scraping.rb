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

  def self.generate_dummy_boardpins
    pin_sum = Pin.count
    Board.find_each do |board|
      times = rand(5) + 2
      for i in 0..times do
        pin_num = rand(pin_sum) + 1
        BoardPin.create(board_id: board.id, pin_id: pin_num)
      end
    end
  end


  def self.generate_dummy_tags
    tags = ["interior", "design", "textile", "graphic", "architecture", "photography", "beauty", "cars", "celebs", "entertainment", "history", "holiday", "illustrations", "outdoors", "science", "sports", "tattoos", "weddings", "geek", "humor", "art", "home", "gardens", "quotes", "DIY", "travel", "food", "kids", "tech", "animals", "health", "education"]
    Pin.find_each do |pin|
      times = rand(3) + 2
      addTags = ""
      for i in 0..times do
        addTags << "#" + tags.sample + " "
      end
      pin.description << addTags
      pin.save
      pin.extract_tags
    end
  end
end
