# Quick Reference Guide

## Commands I Use Most Often

### Run All Tests
Runs every feature and scenario in the framework.

    npm test

Use when:
* Running a full regression
* Verifying changes before committing
* Checking framework health

### Run a Single Tagged Test
Runs only tests with the specified tag.

    npx cucumber-js --tags "@smoke"

Use when:
* Building a new test
* Debugging one scenario
* Avoiding a full regression run

### Run Multiple Tags
    npx cucumber-js --tags "@smoke and not @wip"

Use when:
* Running only a subset of tests
* Excluding work-in-progress tests

### Pause the Test
    (Add right before the failing line)
    await this.page.pause();

Use When: 
* need to keep the browser open during debug

### Open Test Report
Opens the generated HTML report.

    ii .\reports\cucumber-report.html

Use when:
* Reviewing test results
* Investigating failures
* Sharing results with teammates

### Open Reports Folder

    ii .\reports

Use when:
* Looking for generated reports

### Open Screenshots Folder

    ii .\screenshots

Use when:
* Investigating failed tests
* Reviewing screenshot evidence

## Browser Execution
### Run Chromium

    npm run test:chromium

Most commonly used browser.

### Run Firefox

    npm run test:firefox

Use for cross-browser validation.


### Run WebKit (Safari Engine)

    npm run test:webkit

Use for Safari compatibility testing.

## Environment Execution
### Run Production

    $env:TEST_ENV="prod"; npm test

Uses the Production URL from environments.json.

### Run QA

    $env:TEST_ENV="qa"; npm test

Uses the QA URL from environments.json.

### Run Stage

    $env:TEST_ENV="stage"; npm test

Uses the Stage URL from environments.json.

## VS Code Command Palette
Open with:

    Ctrl + Shift + P

Think of this as VS Code's search engine.
If you don't know where a setting lives, search for it here.

### TypeScript: Restart TS Server

    TypeScript: Restart TS Server

What it does:
* Restarts TypeScript without restarting VS Code

Use when:
* Imports suddenly show red squiggles
* Modules aren't recognized
* TypeScript seems confused

This fixes a surprising number of issues.

### TypeScript: Select TypeScript Version

    TypeScript: Select TypeScript Version

Then select:
    Use Workspace Version

What it does:
* Uses the TypeScript version installed in your project

Use when:
* TypeScript behaves differently than expected
* Framework upgrades TypeScript versions

### Developer: Reload Window

    Developer: Reload Window

What it does:
* Reloads VS Code without closing it

Use when:
* Extensions stop working
* Settings changes don't take effect
* Cucumber stops recognizing steps

Equivalent to:
"Turn it off and on again."

### Preferences: Open User Settings (JSON)

    Preferences: Open User Settings (JSON)

What it does:
* Opens VS Code settings as raw JSON

Use when:
* Configuring extensions
* Setting Cucumber paths
* Advanced VS Code customization

### Preferences: Open Workspace Settings (JSON)

    Preferences: Open Workspace Settings (JSON)

What it does:
* Creates settings specific to this project

Use when:
* Configuring project-specific extension settings

Example:
* Cucumber autocomplete paths

## Navigation Commands - POWERSHELL

### Open Current Project in VS Code

    code .

Opens the current folder as a VS Code project.

### Show Current Folder

    pwd


Shows where PowerShell currently is.

Use when:
* Unsure which project you're in

### Show Files in Current Folder

    dir

Displays files and folders.

Use when:
* Checking project structure
* Verifying file creation

## Playwright Debugging

### Pause Execution
Add temporarily inside a step:

    in ts file
    await this.page.pause();

What it does:
* Opens Playwright Inspector
* Allows locator inspection
* Allows step-by-step debugging

Use when:
* Building new automation
* Investigating locator issues

## Most Common Troubleshooting

### Feature Shows "Undefined Step" But Tests Pass
Cause:
* VS Code extension issue

Fix:
* Disable official Cucumber extension
* Use Cucumber (Gherkin) Full Support

### Imports Suddenly Have Red Squiggles
Fix:
    TypeScript: Restart TS Server

### Everything Looks Broken
Fix:
    Developer: Reload Window

Try this before panicking.
