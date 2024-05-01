require 'open-uri'
class RatesController < ApplicationController
 def rate
   @banks = Bank.first(6)
  #  @rates = Array.new
  #  html_content = URI.open('https://www.mortgagerates.co.nz/mortgage-rates').read
  #  doc = Nokogiri::HTML.parse(html_content)
  #  doc.search('.rates-table-wrapper .table-row').each_with_index do |element, index|
  #    puts "#{index + 1}. #{element.text.strip}"
  #    table_cells=element.search('.table-cell')
  #    image=element.search('.bank-logo-container img')
  #    bank_html = element.search('.product-name')
  #    bank_name = bank_html.text.strip
  #    one_year = table_cells[1].text.strip
  #    two_years = table_cells[2].text.strip
  #    three_years = table_cells[3].text.strip
  #    @rates << {
  #      bank_name: bank_name,
  #      one_year: one_year,
  #      three_years: three_years,
  #      two_years: two_years,
  #      image: image.attr('src').to_s,
  #    }
   end
 end
