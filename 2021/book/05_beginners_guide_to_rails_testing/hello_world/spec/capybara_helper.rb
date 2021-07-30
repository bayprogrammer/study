require 'capybara'
require 'capybara/dsl'

# https://www.codewithjason.com/run-rspec-headless-chrome-chromium-alpine-linux/
# https://rubydoc.info/github/teamcapybara/capybara
# https://stackoverflow.com/questions/55970418/rails-capyabra-selenium-chrome-driver-settings
# https://thoughtbot.com/blog/headless-feature-specs-with-chrome
Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless
  config.javascript_driver = :selenium_chrome_headless
end

#Capybara.register_driver :chrome do |app|
#  chrome_driver_options = Selenium::WebDriver::Chrome::Options(
#    driver_path: '/snap/bin/chromium.chromedriver',
#    args: ['headless']
#  )
#  chrome_driver_options.headless!
#  Capybara::Selenium::Driver.new(
#    app,
#    browser: :chrome,
#    options: chrome_driver_options
#  )
#end
#Capybara.register_driver :chrome
#

