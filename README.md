# MyCADM Playwright Automation Framework

A lightweight end-to-end automation framework built with Playwright, TypeScript, and Cucumber/Gherkin.

## Tech Stack

- Playwright
- TypeScript
- Cucumber/Gherkin
- Node.js
- Page Object Model
- JSON environment configuration
- Cucumber HTML reporting

## Framework Features

- Browser launches before each scenario
- Browser closes after each scenario
- Chromium default browser
- Firefox/WebKit browser selection available
- Environment-based base URL configuration
- Page Object Model structure
- Screenshot capture on failed scenarios
- Severe server error capture for HTTP 400/401/403/404/500/502/503/504 responses
- HTML report generation

## Project Structure

features
src
  data
  hooks
  pages
  stepDefinitions
  support
  utils
reports
screenshots