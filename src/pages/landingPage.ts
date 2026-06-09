import { expect, Page } from '@playwright/test';

export default class LandingPage {
  constructor(private page: Page) {}

  async verifyLandingPageIsDisplayed() {
    await expect(this.page.getByText('Example Domain')).toBeVisible();
  }
}