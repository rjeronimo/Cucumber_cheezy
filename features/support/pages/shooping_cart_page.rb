class ShoopingCartPage
   include PageObject

  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  LINES_PER_PUPPY = 6

  button(:proceed_to_checkout, :value => "Complete the Adoption")
  button(:continue_shopping, :value => "Adopt Another Puppy")
  table(:cart, :index => 0)
  cell(:cart_total, :class => "total_cell")
  table(:report, :id => 'report')


  def name_for_line_item(line_item)
    table_value(line_item.to_i,  NAME_COLUMN)
    # cart_line_item(line_item)[1].text
  end

 

  def subtotal_for_line_item(line_item)
    table_value(line_item.to_i, SUBTOTAL_COLUMN)
    #cart_line_item(line_item)[3].text
  end


  private


  def table_value(line_item,column)
    row = (line_item -1 ) * LINES_PER_PUPPY
    cart_element[row][column.to_i].text
  end


=begin

  def cart_total
    @browser.td(:class => 'total_cell').text
  end

     #Report has city in first column and population is second
   def population_for(city)
     row = report_element.find {|r| r[0] == city}
     row[1]
   end

    def row_for(line_item)
    (line_item.to_i - 1) * 6
  end

  def cart_line_item(line_item)
    @browser.table(:index => 0)[row_for(line_item.to_i)]
  end
=end
end
