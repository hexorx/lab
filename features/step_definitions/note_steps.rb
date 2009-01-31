Given /^(?:an|a) (.*) called (.*) with a password of (.*)$/ do |role,login,password|
  role = role.classify.constantize
  user = role.find_by_login login
  user.destroy unless user.nil?
  user = role.create(:login => login, :password => password, :password_confirmation => password, :email => "#{login}@foobar.com")
  user.register!
  user.activate!
end

When /^I log in as (.*) using password (.*)$/ do |login,password|
  visit '/sessions/new'
  fill_in 'Login', :with => login
  fill_in 'Password', :with => password
  click_button 'Log in'
end
