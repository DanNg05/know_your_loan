
Mortgage.destroy_all
Homebuyer.destroy_all

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
broker_1 = Broker.create(first_name: "Dan", last_name: "Nguyen", email: "bestbrokerAU@gmail.com", description:"Mortgage and Finance Broker", phone_number: "0411383838", about: "Dan is a certified financial advisor and has been in the industry for about 6 years. He made the NZ Adviser’s annual Young Guns list in 2019, which ranked him as a strong name in the industry. He also speaks Cantonese.", address: "29 Sale Street Auckland CBD NZ 1010")
broker_2 = Broker.create(first_name: "Doris", last_name: "Xu", email: "2ndbestbrokerAU@gmail.com", description:"Senior Finance Advisor", phone_number: "0466575757", about: "Doris is the type of broker who takes extra care and time to listen to the specific needs of her clients. She invites all questions from her clients and provides careful advice to ensure her clients are comfortable and well-versed.", address: "34 Manners Street Te Aro Wellington NZ 6011")
broker_3 = Broker.create(first_name: "Solo", last_name: "Tohi", email: "3ndbestbrokerAU@gmail.com",description:"Loan Specialist", phone_number: "0466112233", about: "Solo is undoubtably the backbone of Squirrel in new south island office. He sets out to empower his clients through improving their financial knowledge, so they can make the right decisions for their circumstances.", address: "236 High Street, Christchurch Central City, Christchurch NZ 8011")
# ANZ = Bank.create!(name: "ANZ")
# p "Created ANZ Bank"
# rate_1 = Rate.create!(interest_value: 0.069, bank_id: 1)
# p "Created rate 1"


User.create(email:"homebuyer@gmail.com", password: "123456", is_homebuyer: true, admin: false)
User.create(email:"mortgage@gmail.com", password: "123456", is_homebuyer: false, admin: false)
