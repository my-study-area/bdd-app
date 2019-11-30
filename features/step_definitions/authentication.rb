Given("I visit the homepage") do
  visit root_path
end

When("I fill in the sign up form") do
  click_link "Sign up"

  fill_in "user_email", :with => "tester@testdomain.test"
  fill_in "user_password", :with => "pas$$word"
  fill_in "user_password_confirmation", :with => "pas$$word"

  click_button "Sign up"
end

When("I confirm the email") do
  open_email("tester@testdomain.test")

  visit_in_email("Confirm my account")
end

Then("Should see that my account is confirmed") do
  message = "Your email address has been successfully confirmed"

  expect(page).to have_content(message)
end

Given("I am a registered user") do
  @registered_user = FactoryBot.create(:user,
                                      :email => "tester@testdomain.test",
                                      :password => "pa$$word")
end

When("I fill in the loggin form") do
  fill_in "user_email", :with => "tester@testdomain.test"
  fill_in "user_password", :with => "pa$$word"

  click_button "Log in"
end

Then("I should be logged in") do
  expect(page).to have_content("Signed in successfully")
end
