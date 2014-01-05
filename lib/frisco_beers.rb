require 'mechanize'

module Frisco
  def self.beers
    spider = Mechanize.new { |agent|
      agent.user_agent_alias = 'Windows Mozilla'
    }

    beers = []
    page = spider.get('http://friscogrille.com/beers.php')
    page.search('#keg-beers li').each do |beer|
      beers << beer.text
    end

    puts "Frisco Taphouse / Beers:"
    beers.each_with_index do |beer, index|
      puts "[#{index}] #{beer}"
    end
  end
end

Frisco.beers
