
Given(/^I am on the login page$/) do
  visit "https://<workspace>-<ingridmsg>.c9users.io/login"
end

When(/^I enter an e\-mail address$/) do
  fill_in ‘nome’, :with => "emailparateste@teste.com"
end

When(/^I enter a password$/) do
  fill_in 'senha', :with => "senhadousuario"
end

When(/^I click the login button$/) do
  click_button 'ENTRAR'
end

Then(/^I should login to the system$/) do
  expect(page).to have_content 'Connect Donations'
end