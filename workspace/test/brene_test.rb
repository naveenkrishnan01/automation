require 'rubygems'
require 'watir'
require 'watir-webdriver'
require 'mysql'

env = (ARGV[0].nil?) ? "betastg" : ARGV[0]
unless ["betastg", "prod", "src"].include? env
	puts "Please select one of \"betastg\"(default) or \"prod\"  or \"src\""
	exit 0
end


case env
when "betastg"
	env = "http://betastg.oprah.com"
when "prod"
	env = "http://www.oprah.com"
when "src"
	env = "http://wwwsrc.oprah.com"
else
	puts "argv not recognized"
end

puts " ---------------"
puts "Test Brene Brown purchase CC from existing checkout page"
puts "Start:"
puts Time.now

randnum = Random.new.rand(1000..100000).to_s
myusername = "nikumar" + randnum
puts "#{myusername}"
email_extn = "@ownqa.mygbiz.com"
mypassword = "oprah123"

billinfo_fname = "george"
billinfo_lname = "domantay"
billinfo_addr = "5700 Wilshire Blvd"
billinfo_city = "Los Angeles"
billinfo_zip = "90036"
billinfo_phone = "3238802000"
ccinfo_number = "4307367000595087"
ccinfo_seccode = "710"
ccinfo_expiry = "04/16"

expected_regprice = "$69.99"

url = env
brene_landingpage = env + "/own-brene-brown-course/brene-course-bundle-landing.html"
brene_checkoutpage = env + "/own-brene-brown-course/brene-course-bundle.html"
expected_price = "$69.99"  

profile = Selenium::WebDriver::Firefox::Profile.new
driver = Selenium::WebDriver.for :firefox, :profile => profile

if url.include? "betastg"
	driver.navigate.to 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
	driver.navigate.to 'http://ownaccess:oprah@betastg.oprah.com/index.html'
	driver.navigate.to 'https://ownaccess:oprah@betamyown.oprah.com/dump.html'
	driver.navigate.to 'https://ownaccess:oprah@betastg.oprah.com/index.html'
	email_extn = "@yopmail.com"
	billinfo_addr = "100 State Street"
	ccinfo_number = "4111111111111111"
end

puts "Creating new OWN account from Join link on Oprah.com main page "
driver.navigate.to url
driver.manage.window.resize_to(1200, 1800)
sleep(1)
join = driver.find_element(:xpath, '//div[contains(@id,"top_login")]//a//i') 
join.click

sleep(2)

email = driver.find_element(:name, 'email_address')
email.send_keys(myusername + email_extn)
username = driver.find_element(:name, 'username')
username.send_keys(myusername)
password = driver.find_element(:name, 'password')
password.send_keys(mypassword)
passconfirm = driver.find_element(:name, 'password_confirm')
passconfirm.send_keys(mypassword)
dob_month = driver.find_element(:css, 'select#birth_month option:nth-child(2)')
dob_month.click
dob_day = driver.find_element(:css, 'select#birth_dayofmonth option:nth-child(2)')
dob_day.click
dob_year = driver.find_element(:css, 'select#birth_year option:nth-child(20)')
dob_year.click
agree_terms = driver.find_element(:id, 'agree_checkbox')
agree_terms.click

join_button = driver.find_element(:id, 'submit_reg_btn')
join_button.click

sleep(2)


puts "Verifying username: #{myusername} shows on the landing page"
verify_username = driver.find_element(:xpath, '//span[contains(@id, "username")]//a') 
result = (verify_username.text.include? myusername) ? "Pass" : "Fail"
puts "Result: " + result

puts "New student username: #{myusername} clicks Register Now on Brenelanding and lands on checkout page "
driver.navigate.to brene_landingpage 
newstudent_reg_button = driver.find_element(:xpath, '//a[contains(@href, "/own-brene-brown-course/brene-course-bundle.html")]//img[contains(@alt, "Register Now")]')
newstudent_reg_button.click
sleep (2)
result = (driver.current_url.include? "own-brene-brown-course/brene-course-bundle.html") ? "Pass" : "Fail"
puts driver.current_url
puts "Result: " + result 

puts "Verify correct total price on checkout page in Payment Summary #{expected_regprice}"
total_price = driver.find_element(:id, 'total_price')
result = (total_price.text == expected_regprice) ? "Pass" : "Fail"
puts result

driver.find_element(:name, 'x_first_name').click
driver.find_element(:name, 'x_first_name').send_keys(billinfo_fname)

driver.find_element(:name, 'x_last_name').click
driver.find_element(:name, 'x_last_name').send_keys(billinfo_lname)

driver.find_element(:name, 'x_address').click
driver.find_element(:name, 'x_address').send_keys(billinfo_addr)
 
driver.find_element(:name, 'x_city').click
driver.find_element(:name, 'x_city').send_keys(billinfo_city)

driver.find_element(:name, 'x_zip').click
driver.find_element(:name, 'x_zip').send_keys(billinfo_zip)

driver.find_element(:name, 'x_phone').click
driver.find_element(:name, 'x_phone').send_keys(billinfo_phone)

driver.find_element(:name, 'x_card_num').click
driver.find_element(:name, 'x_card_num').send_keys(ccinfo_number)

driver.find_element(:name, 'x_card_code').click
driver.find_element(:name, 'x_card_code').send_keys(ccinfo_seccode)

driver.find_element(:name, 'x_exp_date').click
driver.find_element(:name, 'x_exp_date').send_keys(ccinfo_expiry)

sleep (3)
driver.find_element(:name, 'buy_button').click

sleep (3)


puts "Verifying after purchase user lands on Thank You page"
expected_thankyou_url = "own-brene-brown-course/brene-course-bundle.html?thankyou=1&omniture_event="
result = (driver.current_url.include? expected_thankyou_url) ? "Pass" : "Fail"
puts "Result: " + result 
puts driver.current_url

begin
	          db =Mysql.real_connect("chiownsql01.myown.int", "nkrishnan", "@utom@t3", "maui_master")
		                puts "CONNECTION SUCCESSFUL"
	 puts "Starting Time now #{Time.now}"
             puts 'Entity-id' + '   ' 	 
          ts = db.query "select ent.entity_displayname from entity ent where ent.entity_id in (select b.entity_id from ecommerce_order b join (select count(entity_id) t, a.order_id from ecommerce_order a group by a.entity_id) c on b.order_id=c.order_id  where c.t=1) and entity_displayname like '#{myusername}'"
        ts.each_hash do |row|
         puts row['entity_displayname']
end

rescue Mysql::Error => e
          puts "Error code: #{e.errno}"
              puts "Error message: #{e.error}"
                  puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
ensure
          db.close if db
end


sleep (2)
driver.quit

