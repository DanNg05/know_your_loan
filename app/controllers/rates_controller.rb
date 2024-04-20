require 'open-uri'
class RatesController < ApplicationController
  def rate
    @rates = Array.new
    html_content = URI.open('https://www.mortgagerates.co.nz/mortgage-rates').read
    doc = Nokogiri::HTML.parse(html_content)
    doc.search('.rates-table-wrapper .table-row').each_with_index do |element, index|
      # puts "#{index + 1}. #{element.text.strip}"
      table_cells=element.search('.table-cell')
      image=element.search('.bank-logo-container img')
      bank_html = element.search('.product-name')
      bank_name = bank_html.text.strip
      first_year = table_cells[1].text.strip
      second_year = table_cells[2].text.strip
      third_year = table_cells[3].text.strip
      @rates << {
        bank_name: bank_name,
        first_year: first_year,
        third_year: third_year,
        second_year: second_year,
        image: image.attr('src').to_s,
      }
    end
  end
end
# narrow down table_cells[0]
#add image instead of name possibly
#models and db, workers(sidekiq) reun every 12/24 hours, retrieve data from database
