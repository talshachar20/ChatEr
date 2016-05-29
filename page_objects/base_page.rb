require 'selenium-webdriver'

class BasePage
  def type(locator, input)
    @driver.find_element(locator).send_keys input
  end

  def click_on(locator)
    @driver.find_element(locator).click
  end

  def quit
    @driver.quit
  end
end