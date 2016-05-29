require_relative 'base_page'

class StackOverflowLoginPage < BasePage
  attr_accessor :driver, :selectors
  ENV['base_url'] = 'https://stackoverflow.com/users/login'
  @driver = nil

  def initialize(driver)
    @driver = driver
    initialize_selectors
    @driver.manage.timeouts.implicit_wait = 2
  end

  def visit
    @driver.navigate.to ENV['base_url']
  end

  def type_user_mail(user_mail)
    puts "typing #{user_mail} as user mail"
    user_mail_field = selectors[:USER_MAIL_LOGIN]
    type(user_mail_field, user_mail)
  end

  def type_password(password)
    puts "typing #{password} as password"
    user_password_field = selectors[:USER_PASSWORD]
    type(user_password_field, password)
  end

  def submit_login
    puts 'submit login'
    click_on selectors[:SUBMIT]
  end

  def get_error_message
     @driver.find_element(selectors[:INCORRECT_CREDENTIALS]).text
  end

  private

  def initialize_selectors
    @selectors = {
        USER_MAIL_LOGIN:  { id: 'email' },
        USER_PASSWORD: { id: 'password' },
        SUBMIT: { id: 'submit-button' },
        INCORRECT_CREDENTIALS: { css: 'div.message.message-error' }
    }
  end
end
