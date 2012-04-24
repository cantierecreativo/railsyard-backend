module FlashHelpers

  def have_notice(message)
    xpath = XPath.generate do |x|
      x.descendant(:div)[ x.attr(:class).contains('flash-notice') & x.contains(message)]
    end
    Capybara::RSpecMatchers::HaveMatcher.new(:xpath, xpath.to_xpath)
  end

  def have_alert(message)
    xpath = XPath.generate do |x|
      x.descendant(:div)[ x.attr(:class).contains('flash-alert') & x.contains(message)]
    end
    Capybara::RSpecMatchers::HaveMatcher.new(:xpath, xpath.to_xpath)
  end

end

RSpec.configuration.include FlashHelpers, type: :request
