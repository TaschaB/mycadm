import { When,Then } from '@cucumber/cucumber';
import { CustomWorld } from '../support/world';
import LandingPageVerify, { LandingPage } from '../pages/landingPage';
import { expect } from '@playwright/test';

Then('the landing page should be displayed', async function (this: CustomWorld) {
  const landingPageVerify = new LandingPageVerify(this.page);
  await landingPageVerify.verifyLandingPageIsDisplayed();
});

When(
  'I click top nav bar {string} Link',
  async function (this: CustomWorld, linkName: string) {
      const landingPage = new LandingPage(this.page);
      await landingPage.clickTopNavLink(linkName);
  }
);

Then(
  'I navigate to {string} Page',
  async function (this: CustomWorld, expectedText: string) {

    await expect(
      this.page.getByText(expectedText)
    ).toBeVisible();

  }
);

When(
  'I click bottom {string} Link',
  async function (this: CustomWorld, linkName: string) {

      const landingPage = new LandingPage(this.page);
      await landingPage.clickFooterNavLink(linkName);
  }
);