import { Then } from '@cucumber/cucumber';
import { CustomWorld } from '../support/world';
import LandingPage from '../pages/landingPage';

Then('the landing page should be displayed', async function (this: CustomWorld) {
  const landingPage = new LandingPage(this.page);
  await landingPage.verifyLandingPageIsDisplayed();
});