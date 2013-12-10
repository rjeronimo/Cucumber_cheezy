Given(/^I am on the puppy adoption site$/) do
 # @browser.goto "http://puppies.herokuapp.com"
 # @home = HomePage.new(@browser)
  visit(HomePage)
end

When(/^I click the View Details button "(\d+)"$/) do |num|
  #@browser.button(:value => 'View Details', :index=>num.to_i - 1).click
  #@home.select_puppy_number(num)
  #@details = DetailsPage.new(@browser)

  on(HomePage).select_puppy_number num.to_i
end

When(/^I click the Adopt Me button$/) do
  #@browser.button(:value => 'Adopt Me!').click
  #@cart = ShoopingCartPage.new(@browser)
  on(DetailsPage).add_to_cart
end

When(/^I click the Complete the Adoption button$/) do
  # @browser.button(:value => 'Complete the Adoption').click
  on(ShoopingCartPage).proceed_to_checkout
end

And(/^I click the Adopt Another Puppy button$/) do
  # @browser.button(:value => 'Adopt Another Puppy').click
  on(ShoopingCartPage).continue_shopping
end

When(/^I enter "(.*?)" in the name field$/) do |name|
  # @browser.text_field(:id => 'order_name').set(name)
  on(CheckoutPage).name = name
end

When(/^I enter "(.*?)" in the address field$/) do |address|
 # @browser.text_field(:id => 'order_address').set(address)
  on(CheckoutPage).address = address
end
When(/^I enter "(.*?)" in the email field$/) do |email|
  on(CheckoutPage).email = email
end
When(/^I select "(.*?)" from the pay with dropdown$/) do |pay_type|
  on(CheckoutPage).pay_type = pay_type
end
When(/^I click the Place Order button$/) do
  on(CheckoutPage).place_order
end

Then(/^I should see "(.*?)"$/) do |message|
  @browser.text.should include message
end

Then /^I should see "([^"]*)" as the name for line item (\d+)$/ do |name, line_it|
  on(ShoopingCartPage).name_for_line_item(line_it.to_i).should include name
end

When /^I should see "([^"]*)" as the subtotal for line item (\d+)$/ do |subtotal,line_item|
  # cart_line_item(line_item.to_i)[3].text.should == subtotal
  on(ShoopingCartPage).subtotal_for_line_item(line_item) == subtotal
end

And(/^I should see "([^"]*)" as the cart total$/) do |total|
  # @browser.td(:class => 'total_cell').text.should == total
  on(ShoopingCartPage).cart_total.should == total
end



