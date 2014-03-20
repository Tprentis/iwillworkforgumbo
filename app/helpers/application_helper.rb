module ApplicationHelper
  def submit_or_cancel(form, name='Simmer Just A Bit!')
    form.submit + " or " + link_to(name, 'javascript:history.go(-1);', :class => 'cancel')
  end


  def flash_display
    response = ""
    flash.each do |name, msg|
      response = response + content_tag(:div, msg, :id => "flash_#{name}")
    end
    flash.discard
    response
  end

end
