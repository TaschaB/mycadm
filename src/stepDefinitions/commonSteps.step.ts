import { When,Then } from '@cucumber/cucumber';
import { CustomWorld } from '../support/world';
import { LandingPage } from '../pages/landingPage';

When(
  'I click {string} button',
  async function (this: CustomWorld, automationKey: string) {

    await this.page
      .locator(`[data-automation="${automationKey}"]`)
      .click();
  }
);

When('I decline Cookies', async function (this: CustomWorld) {
  const landingPage = new LandingPage(this.page);
  await landingPage.dismissCookieBannerIfVisible();
})