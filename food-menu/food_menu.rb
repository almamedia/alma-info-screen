#! /usr/bin/env ruby
require 'nokogiri'
require 'open-uri'
require 'firebase'
require 'json'
require "net/http"


class Restaurants

  def initialize(day)
    @day = day
  end

  def get_fazer
    url = "http://www.fazer.fi/api/location/menurss/current?pageId=897&language=fi"
    document = Nokogiri::XML(open(url))
    table = Nokogiri::HTML(document.xpath('//rss//channel//item//description').first.content.to_s)

    result = Array.new(5) {Array.new(5)}

    table.xpath("//table//tbody//tr//td[@colspan='3']//p").each_with_index do |elem, index|
      elem_day = index / 5;
      entry = elem.at_xpath('.//span').content.to_s + ": " + elem.at_xpath('text()').to_s
      result[elem_day][index % 5] = entry
    end
    return result[@day]
  end

  def get_bastis
    url = "http://www.bastis.fi/bastis-lounas/"
    document = Nokogiri::HTML(open(url))

    result = Array.new(5) {""}

    result[0] = document.at_xpath("//div[@class='menu-item-price-bottom']//text()").to_s.strip

    document.xpath("//div[@class='menu-item-description']").each_with_index do |elem, index|
      entry = elem.xpath(".//text()").to_s.strip
      result[index + 1] = entry
    end
    return result[@day]
  end

  def get_satkar
    days = ["Maanantai", "Tiistai", "Keskiviikko", "Torstai", "Perjantai"];
    today = days[@day];
    days_url = "http://www.satkar.fi/fi/index.php?section=1"
    days_doc = Nokogiri::HTML(open(days_url))

    url = days_doc.at_xpath("//a[@title='#{today}']")['href']

    document = Nokogiri::HTML(open(url))

    result = Array.new

    document.xpath("//tbody/tr").each_with_index do |elem, index|
      entry = elem.at_xpath(".//td").content
      result[index] = entry
    end
    return result
  end

  def get_menus
    restaurants = [
      {:name => "fazer", :menu => get_fazer},
      {:name => "bastis", :menu => get_bastis},
      {:name => "satkar", :menu => get_satkar}
    ];
  end

end

def send_to_api(data)
  uri = URI.parse("http://localhost:3000/componentdata")
  req = Net::HTTP::Patch.new(uri)
  req.set_form_data(:name => "FoodMenu", :data => data)

  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end

  case res
  when Net::HTTPSuccess, Net::HTTPRedirection
    # Ok
  else
    puts res.value
  end
end

def main
  today = Time.now.wday
  restaurants = Restaurants.new(today)
  menus = restaurants.get_menus
  data = JSON.generate(menus)
  send_to_api(data)
end

main()
