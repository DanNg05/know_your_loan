Rate.destroy_all
Bank.destroy_all
User.destroy_all
Broker.destroy_all
html_content = URI.open('https://www.mortgagerates.co.nz/mortgage-rates').read
doc = Nokogiri::HTML.parse(html_content)
doc.search('.rates-table-wrapper .table-row').each_with_index do |element, index|
  next if index == 0
    table_cells=element.search('.table-cell')
    image=element.search('.bank-logo-container img')
    bank_html = element.search('.table-link .product-name')
    bank_name = bank_html.text.strip
    one_year = table_cells[1].text.strip
    two_years = table_cells[2].text
    three_years = table_cells[3].text.strip


    bank = Bank.create!(name:bank_name, image_url:image.attr('src').to_s)
    bank.rates.create!(interest_value:one_year)
    bank.rates.create!(interest_value:two_years)
    bank.rates.create!(interest_value:three_years)
end



dan_user = User.create(email: "dan@gmail.com", password: "123456", admin: false)
admin = User.create(email: "admin@gmail.com", password: "123456", admin: true)
broker_1 = Broker.create(first_name: "Dan", last_name: "Nguyen", email: "bestbrokerAU@gmail.com", phone_number: "0411383838", about: "Dan is well and truly one of our championed brokers at AU BEST BROKER. He’s a huge asset to the AU BEST BROKER family, providing wonderful lending advice to his South Australia community and beyond.", address: "211 Payneham Rd St Peters SA 5069")
broker_2 = Broker.create(first_name: "Carly", last_name: "Cawthorne", email: "2ndbestbrokerAU@gmail.com", phone_number: "0466575757", about: "Carly is the type of broker who takes extra care and time to listen to the specific needs of her clients. She invites all questions from her clients and provides careful advice to ensure her clients are comfortable and well-versed.", address: "11 Hutt Street Adelaide SA 5000")
broker_3 = Broker.create(first_name: "Cassandra", last_name: "Stoodley", email: "3ndbestbrokerAU@gmail.com", phone_number: "0466112233", about: "Cassandra is undoubtably the backbone of the Bernie Lewis South Coast crew. She sets out to empower her clients through improving their financial knowledge, so they can make the right decisions for their circumstances.", address: "23 Swift Ave, Dulwich SA 5065")
# ANZ = Bank.create!(name: "ANZ")
# p "Created ANZ Bank"
# rate_1 = Rate.create!(interest_value: 0.069, bank_id: 1)
# p "Created rate 1"
