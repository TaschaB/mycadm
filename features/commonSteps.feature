Feature: common step definitions

# run and get allure command     npx allure run -- npx cucumber-js --tags "@signin3"

Then I navigate to "" Page
When I decline Cookies
Given I am signed in as a valid user
Then I should see a banner saying ""