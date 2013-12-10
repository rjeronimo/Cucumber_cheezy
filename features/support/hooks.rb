
require 'watir-webdriver'

World(PageObject::PageFactory)



Before do
  @browser = Watir::Browser.new :firefox

end


After do
  @browser.close
end