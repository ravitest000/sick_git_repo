require 'page-object'

class MockPage
  include PageObject

  element(:header, :css=>'header')
  elements(:label, :css=>"#frm label[id*='txt_val']")
  label(:total, :css=>'#txt_ttl_val')

  def verify_user_land_on_mock_page
    self.header == 'Mock Page for Exercise'
  end

  def verify_user_should_see_list_of_text_views(count)
    self.label_elements.size == count.to_i
  end

  def verify_value_in_text_view_greater_than(minimum_value)
    flag= true
    self.label_elements.each do |e|
      if(e.text.gsub('$', '').gsub(',','').to_f == minimum_value.to_f)
        flag= false
      end
    end
    flag
  end

  def verify_following_values_in_text_views
    values=[]
    self.label_elements.each do |e|
      values.push(e.text.chomp)
    end
    values
  end

  def verify_values_formatted_in_currencies
    flag=false
    self.label_elements.each do |e|
      if(e.text.chomp =~ /^\$([0-9,\.]+)/)
        flag=true
      else
        flag=false
      end
    end
    flag
  end


  def verify_sum_of_all_text_views_equals_to_total
    sum = 0
    self.label_elements.each do |e|
      sum+=e.text.gsub('$', '').gsub(',','').to_f
    end
    p "sum==self.total.gsub('$', '').gsub(',','').to_f
    = #{sum}, #{self.total.gsub('$', '').gsub(',','').to_f},
    #{sum==self.total.gsub('$', '').gsub(',','').to_f}"

    sum==self.total.gsub('$', '').gsub(',','').to_f
  end
end
