Feature: Landing Page
@landingPage

@landing1
  Scenario: Open MyCADM homepage
    Given I open the MyCADM homepage
    Then the landing page should be displayed

@landing2
  Scenario: Click top Nav Bar About Link
    Given I open the MyCADM homepage
    When I click top nav bar "About" Link 
    Then I navigate to "About mycadm" Page

@landing3
  Scenario: Click top Nav Bar Privacy Link
    Given I open the MyCADM homepage
    When I click top nav bar "Privacy" Link
    Then I navigate to "Privacy & Trust" Page

@landing4
  Scenario: Click Sign In Button
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page

@landing5
  Scenario: Click First Opt Res Button
    Given I open the MyCADM homepage
    When I click "app.landing.hero.button.signup" button
    Then I navigate to "Your free trial includes:" Page

@landing6
  Scenario: Click First Opt Res Button 2
    Given I open the MyCADM homepage
    When I click "app.landing.pricing.button.signup" button
    Then I navigate to "Your free trial includes:" Page

@landing7
  Scenario: Click Free Trial button
    Given I open the MyCADM homepage
    When I click "app.landing.cta.button.signup" button
    Then I navigate to "Your free trial includes:" Page

@landing8
  Scenario: Click bottom About Link
    Given I open the MyCADM homepage
    When I decline Cookies
    When I click bottom "About" Link
    Then I navigate to "About mycadm" Page

@landing9
  Scenario: Click bottom Privacy Link
    Given I open the MyCADM homepage
    When I decline Cookies
    When I click bottom "Privacy" Link
    Then I navigate to "Privacy & Trust" Page

@landing10
  Scenario: Click bottom Terms Link
    Given I open the MyCADM homepage
    When I decline Cookies
    When I click bottom "Terms" Link
    Then I navigate to "11. Governing Law" Page

@landing11
  Scenario: Click bottom Cookies Link
    Given I open the MyCADM homepage
    When I decline Cookies
    When I click bottom "Cookies" Link
    Then I navigate to "Updates to This Policy" Page

@landing12
  Scenario: Click bottom Disclaimer Link
    Given I open the MyCADM homepage
    When I decline Cookies
    When I click bottom "Disclaimer" Link
    Then I navigate to "Disclaimer" Page

@landing13
  Scenario: Click bottom Disclaimer Link
    Given I open the MyCADM homepage
    When I decline Cookies
    When I click bottom "Contact Us" Link
    Then I navigate to "Contact Us" Page

# ---- NEGATIVE TEST CASES -----
@landingNegative1
Scenario: Cookie banner does not block footer navigation after declining cookies
  Given I open the MyCADM homepage
  When I decline Cookies
  Then the footer navigation should be accessible

  @landingNegative2
Scenario: Invalid automation key does not navigate away from landing page
  Given I open the MyCADM homepage
  When I try to click "app.landing.button.fake" button
  Then I should remain on the MyCADM homepage

  @landingNegative5
Scenario: Cookie banner decline action is safe when banner is not visible
  Given I open the MyCADM homepage
  When I decline Cookies
  When I decline Cookies
  Then the landing page should be displayed

  @landingNegative6
Scenario: Required landing page call-to-action buttons are not missing
  Given I open the MyCADM homepage
  Then the "app.landing.button.signin" button should be visible
  Then the "app.landing.hero.button.signup" button should be visible
  And the "app.landing.pricing.button.signup" button should be visible
  And the "app.landing.cta.button.signup" button should be visible
