require 'os'
require 'selenium-webdriver'
require File.expand_path('../sick_site/features/pageobjects/MockPage')

module InitiateDriver
  def platform
    if(OS.windows?)
      return "windows".upcase
    elsif(OS.linux?)
      return "linux".upcase
    elsif(OS.mac?)
      return "mac".upcase
    else
      return OS.host
    end
  end


  def drivers
    puts "<p><b>date</b> is #{Time.new.strftime('%Y-%m-%d')}</p>"
    puts "<p><b>time</b> is #{Time.new.strftime('%I:%M:%S %p')}</p>"
    puts "<p><b>platform</b> is <b>#{platform}</b>"
    puts "<p><b>browser</b> is <b>#{ENV['browser']}</b>"

    if(ENV['browser'].to_s.downcase == 'chrome')
      Selenium::WebDriver::Chrome.driver_path= 'drivers\chromedriver.exe'
      @driver=Selenium::WebDriver.for :chrome
    elsif(ENV['browser'].to_s.downcase == 'firefox')
      @driver=Selenium::WebDriver.for :firefox
    end
  end

  @driver
end

After do|scenario|
  @driver.quit
end

World(InitiateDriver)
