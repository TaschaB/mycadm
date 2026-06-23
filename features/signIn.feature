Feature: Sign In Scenarios
 @signin

@signin1
  Scenario: Successful Sign In
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    Given I am signed in as a valid user
    Then I navigate to "Dashboard" Page
    
@signin2
  Scenario: Failed Sign in - wrong password
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign in with a invalid password
    Then I should see a banner saying "Sign in failed" 

@signin3
  Scenario: Failed Sign in - wrong username
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign in with a invalid username
    Then I should see a banner saying "Sign in failed" 

@signin4
  Scenario: Failed Sign in - wrong username and password
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign in with a invalid credentials
    Then I should see a banner saying "Sign in failed" 

@signin5
  Scenario: Failed Sign in - blank username
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign enter only password
    Then I should see a banner saying "Please fill in all fields"

@signin6
  Scenario: Failed Sign In - blank password
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign enter only username
    Then I should see a banner saying "Please fill in all fields"

@signin7
Scenario: Failed Sign In - blank username and password
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I click "app.auth.button.signin" button
    Then I should see a banner saying "Please fill in all fields"

# username validation - leading spaces
# username validation - trailing spaces
# password validation - leading spaces
# password validation - trailing spaces

# username validation - maximum length
# username validation - exceeds maximum length
# username validation - special characters
# username validation - SQL injection attempt
# username validation - XSS injection attempt

# password validation - maximum length
# password validation - exceeds maximum length
# password validation - special characters
# password validation - unicode characters

# view password toggle - show password
# view password toggle - hide password
# view password toggle - password value remains unchanged
# view password toggle - icon state changes correctly

# navigate from sign in to sign up
# navigate from sign up to sign in
# navigate to forgot password page
# return from forgot password page

# browser back button from sign in page
# browser forward button from sign in page

# forgot password - valid username
# forgot password - unknown username
# forgot password - blank username
# forgot password - expired reset link
# forgot password - reused reset link
# forgot password - successful password reset
# forgot password - Sign In with new password
# forgot password - old password no longer works

# logout successfully
# verify user redirected after logout
# browser back button after logout
# direct URL access after logout

# session persists after page refresh
# session timeout after inactivity
# session timeout redirects to Sign In page

# multiple failed Sign In attempts
# account lockout after failed Sign In threshold
# account unlock process

# unauthenticated user attempts protected page
# unauthenticated user redirected to Sign In page

# authenticated user attempts Sign In page
# authenticated user redirected away from Sign In page

# verify session cookie created after Sign In
# verify session cookie removed after logout

# successful new user registration
# registration with duplicate username
# registration with duplicate email
# registration with weak password
# registration with password mismatch
# registration required field validation
# email verification workflow
# Sign In after registration
# delete user account

# --- CORE Sign In ---
# --- VALIDATION ---
# --- FORGOT PASSWORD --- 
# --- SESSION MANAGEMENT ---
# --- SECURITY ---
# --- USER REGISTRATION ---

# enter valid email address into email box warning