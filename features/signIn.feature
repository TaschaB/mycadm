Feature: Sign In Scenarios

# CORE SIGN IN
@signin1
  Scenario: Successful Sign In
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    Given I am signed in as a valid user
    Then I navigate to "Dashboard" Page

@signin2
Scenario: Pressing Enter submits the Sign In form
  When I enter credentials for "validUser"
  And I press Enter in the password field
  Then I navigate to "Dashboard" Page
    
@signin3
  Scenario: Failed Sign in - wrong password
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign in with a invalid password
    Then I should see a banner saying "Sign in failed" 

@signin4
  Scenario: Failed Sign in - wrong username
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign in with a invalid username
    Then I should see a banner saying "Sign in failed" 

@signin5
  Scenario: Failed Sign in - wrong username and password
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign in with a invalid credentials
    Then I should see a banner saying "Sign in failed" 

@signin6
  Scenario: Failed Sign in - blank username
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign enter only password
    Then I should see a banner saying "Please fill in all fields"

@signin7
  Scenario: Failed Sign In - blank password
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign enter only username
    Then I should see a banner saying "Please fill in all fields"

@signin8
Scenario: Failed Sign In - blank username and password
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I click "app.auth.button.signin" button
    Then I should see a banner saying "Please fill in all fields"

@signin9
Scenario: Error message clears after editing credentials
  When I sign in as "invalidCredentials"
  Then I should see a banner saying "Sign in failed"
  When I update the username field with "validUsername"
  Then the banner should not be displayed

# INPUT VALIDATION
@signin10
  Scenario: username validation - leading spaces
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign enter leading username
    Then I should see a banner saying "Sign in failed" 
    
@signin11
  Scenario: username validation - trailing spaces
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign enter trailing username
    Then I should see a banner saying "Sign in failed" 

@signin12
  Scenario: password validation - leading spaces
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign enter leading password
    Then I should see a banner saying "Sign in failed" 

@signin13
Scenario: password validation - trailing spaces
    Given I open the MyCADM homepage
    When I click "app.landing.button.signin" button
    Then I navigate to "Sign in" Page
    When I sign enter trailing password
    Then I should see a banner saying "Sign in failed" 

@signin14
Scenario: Login rejects unicode characters in password field
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I sign in as "unicodePassword"
  Then I should see a banner saying "Sign in failed"

@signin15
Scenario: Email field warns for valid email entered into username field
  When I enter "validEmailAddress" into the username field
  Then I should see a username field validation warning


# PASSWORD VISIBILITY
@signin16
Scenario: View password toggle - show password
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I enter a password into the password field
  When I click the Show password toggle
  Then the password should be visible in the password field 

@signin17
Scenario: View password toggle hides password
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I enter "validPassword" into the password field
  And I click the Show password toggle
  And I click the Hide password toggle
  Then the password field should mask the password value


@signin18
Scenario: View password toggle does not change password value
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I enter "validPassword" into the password field
  And I click the Show password toggle
  And I click the Hide password toggle
  Then the password field value should still be "validPassword"

@signin19
Scenario: View password toggle icon state changes correctly
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I enter "validPassword" into the password field
  And I click the Show password toggle
  Then the password toggle should show the hide password state
  When I click the Hide password toggle
  Then the password toggle should show the show password state

# NAVIGATION
@signin20
Scenario: Navigate from Sign In to Sign Up
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I click the Sign Up link
  Then I navigate to "Sign Up" Page
  When I click the Sign Up link
  Then I navigate to "Sign Up" Page

@signin21
Scenario: SQL injection attempt with username
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I sign in as "sqlInjectionUsername"
  Then I should see a banner saying "Sign in failed"

@signin22
Scenario: Navigate to Forgot Password page
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I click the Forgot Password link
  Then I navigate to "Forgot Password" Page
  When I click the Forgot Password link
  Then I navigate to "Forgot Password" Page

@signin23
Scenario: Return from Forgot Password page
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I click the Forgot Password link
  Then I navigate to "Forgot Password" Page
  When I click the Sign In link
  Then I navigate to "Sign in" Page

@signin24
Scenario: Browser back button from Sign In page
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I go back in the browser
  Then I navigate to "Home" Page
  When I go back in the browser
  Then I navigate to "Home" Page

@signin25
Scenario: Browser forward button returns to Sign In page
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I go back in the browser
  And I go forward in the browser
  Then I navigate to "Sign in" Page

# FORGOT PASSWORD
@signin26
Scenario Outline: Forgot password validation
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I click the Forgot Password link
  Then I navigate to "Forgot Password" Page
  When I submit forgot password as "<userType>"
  Then I should see a banner saying "<message>"

    Examples:
      | userType        | message                    |
      | validUsername   | Password reset email sent  |
      | unknownUsername | Username not found         |
      | blankUsername   | Please fill in all fields  |

@signin27
Scenario: Forgot password with unknown username
  When I click the Forgot Password link
  Then I navigate to "Forgot Password" Page
  When I submit a password reset request for "unknownUsername"
  Then I should see a banner saying "Username not found"

@signin28
Scenario: Forgot password with blank username
  When I click the Forgot Password link
  Then I navigate to "Forgot Password" Page
  When I submit a blank password reset request
  Then I should see a banner saying "Please fill in all fields"

@signin29
Scenario: Expired password reset link
  Given I have an expired password reset link
  When I open the password reset link
  Then I should see a banner saying "Password reset link has expired"

@signin30
Scenario: Reused password reset link
  Given I have already used a password reset link
  When I open the password reset link
  Then I should see a banner saying "Password reset link is no longer valid"


@signin31
Scenario: Successful password reset
  Given I have a valid password reset link
  When I reset my password
  Then I should see a banner saying "Password reset successful"

@signin32
Scenario: New password cannot match old password
  Given I have a valid password reset link
  When I reset my password using "currentPassword"
  Then I should see a banner saying "New password cannot match current password"

@signin33
Scenario: Sign In with new password
  Given I have successfully reset my password
  When I sign in as "newPasswordUser"
  Then I navigate to "Dashboard" Page


@signin34
Scenario: Old password no longer works after password reset
  Given I have successfully reset my password
  When I sign in as "oldPasswordUser"
  Then I should see a banner saying "Sign in failed"


  # LOGOUT
@signin35
Scenario: Logout successfully
  Given I am signed in as a valid user
  When I log out
  Then I navigate to "Sign in" Page

@signin36
Scenario: Browser back button after logout does not restore session
  Given I am signed in as a valid user
  When I log out
  And I go back in the browser
  Then I should remain signed out

@signin37
Scenario: Direct URL access after logout
  Given I am signed in as a valid user
  And I log out
  When I navigate directly to "Dashboard" Page
  Then I navigate to "Sign in" Page

# SESSION MANAGEMENT
@signin38
Scenario: Session persists after page refresh
  Given I am signed in as a valid user
  When I refresh the page
  Then I should remain signed in



@signin39
Scenario: Session timeout after inactivity
  Given I am signed in as a valid user
  When my session expires due to inactivity
  Then I should no longer be authenticated

@signin40
Scenario: Session timeout redirects to Sign In page
  Given I am signed in as a valid user
  When my session expires due to inactivity
  Then I navigate to "Sign in" Page

@signin41
Scenario: Logout in one tab logs user out in another tab
  Given I am signed in as a valid user
  And I open a new browser tab
  When I log out in the current browser tab
  And I switch to the other browser tab
  And I refresh the page
  Then I should remain signed out
  And I navigate to "Sign in" Page

  @signin42
  Scenario: Unauthenticated user is redirected from protected page
    When I navigate directly to the "Dashboard" Page
    Then I should be redirected to the Sign In page

@signin43
Scenario: Authenticated user is redirected away from Sign In page
  Given I am signed in as a valid user
  When I navigate directly to the "Sign in" Page
  Then I navigate to "Dashboard" Page

# SECURITY
@signin44
Scenario: Login rejects SQL injection attempt in username field
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  When I sign in as "sqlInjectionComment"
  Then I should see a banner saying "Sign in failed" 

@signin45
Scenario: Login rejects XSS attempt in username field
  Given I open the MyCADM homepage
  When I click "app.landing.button.signin" button
  Then I navigate to "Sign in" Page
  And I am watching for browser dialogs
  When I sign in as "xssInjectionUsername"
  Then I should see a banner saying "Sign in failed" 
  And no browser dialog should appear

@signin46
Scenario: Multiple failed Sign In attempts
  When I fail to sign in 3 consecutive times
  Then I should see a banner saying "Sign in failed"

@signin47
Scenario: Account lockout after failed Sign In threshold
  When I fail to sign in until the account lockout threshold is reached
  Then I should see a banner saying "Account locked"

@signin48
Scenario: Account unlock process
  Given my account is locked
  When I complete the account unlock process
  Then my account should be unlocked
  When I sign in as a valid user
  Then I navigate to "Dashboard" Page

@signin49
Scenario: Session cookie is created after Sign In
  Given I am signed in as a valid user
  Then the session cookie should exist

@signin50
Scenario: Session cookie is removed after logout
  Given I am signed in as a valid user
  When I log out
  Then the session cookie should not exist

@signin51
Scenario: User cannot access cached protected page after logout
  Given I am signed in as a valid user
  And I navigate directly to a protected page
  When I log out
  And I go back in the browser
  Then I should remain signed out
  And I navigate to "Sign in" Page

# REGISTRATION
@signin52
Scenario Outline: Registration validation
  When I click the Sign Up link
  Then I navigate to "Sign Up" Page
  When I register as "<userType>"
  Then I should see a banner saying "<message>"

    Examples:
      | userType              | message                        |
      | newUser               | Registration successful        |
      | duplicateUsername     | Username already exists        |
      | duplicateEmail        | Email already exists           |
      | weakPassword          | Password does not meet requirements |
      | passwordMismatch      | Passwords do not match         |
      | missingRequiredFields | Please fill in all fields      |

@signin53
Scenario: Registration with duplicate username
  When I click the Sign Up link
  Then I navigate to "Sign Up" Page
  When I register as "duplicateUsername"
  Then I should see a banner saying "Username already exists"

@signin54
Scenario: Registration with duplicate email
  When I click the Sign Up link
  Then I navigate to "Sign Up" Page
  When I register as "duplicateEmail"
  Then I should see a banner saying "Email already exists"

@signin55
Scenario: Registration with weak password
  When I click the Sign Up link
  Then I navigate to "Sign Up" Page
  When I register as "weakPassword"
  Then I should see a banner saying "Password does not meet requirements"

@signin56
Scenario: Registration with password mismatch
  When I click the Sign Up link
  Then I navigate to "Sign Up" Page
  When I register as "passwordMismatch"
  Then I should see a banner saying "Passwords do not match"

@signin57
Scenario: Registration required field validation
  When I click the Sign Up link
  Then I navigate to "Sign Up" Page
  When I register as "missingRequiredFields"
  Then I should see a banner saying "Please fill in all fields"

@signin58
Scenario: Email verification workflow
  When I click the Sign Up link
  Then I navigate to "Sign Up" Page
  When I register as "newUser"
  Then I should see a banner saying "Verification email sent"
  When I verify the email for "newUser"
  Then I should see a banner saying "Email verified successfully"

@signin59
Scenario: Sign In after registration
  When I click the Sign Up link
  And I register as "newUser"
  Then I should see a banner saying "Registration successful"
  When I navigate to the Sign In page
  And I sign in as "newlyRegisteredUser"
  Then I navigate to "Dashboard" Page

@signin60
Scenario: Delete user account
  Given I am signed in as a valid user
  When I request to delete my user account
  And I confirm the account deletion
  Then I should see a banner saying "Account deleted successfully"
  And I navigate to "Home" Page





























