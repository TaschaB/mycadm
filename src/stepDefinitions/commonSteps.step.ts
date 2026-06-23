import { When,Then, Given } from '@cucumber/cucumber';
import { CustomWorld } from '../support/world';
import { LandingPage } from '../pages/landingPage';
import { SignInPage } from '../pages/signInPage';
import { BannerPage } from '../pages/BannerPage';
import users from '../data/users.json';

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

Given('I am signed in as a valid user', async function () {
  const signInPage = new SignInPage(this.page);

  await signInPage.login(
    users.validUser.username,
    users.validUser.password
  );
});

Then('I should see a banner saying {string}', async function (message: string) {
  const bannerPage = new BannerPage(this.page);

  await bannerPage.verifyBannerText(message);
});