import { expect, Page } from '@playwright/test';
import { BasePage } from './BasePage';

export default class LandingPageVerify {
  constructor(private page: Page) {}
  async verifyLandingPageIsDisplayed() {
    await expect(this.page.getByText('help you find jobs.')).toBeVisible();
  }
}
export class LandingPage extends BasePage {
  constructor(page: Page) {
    super(page);
  }

  async clickTopNavLink(linkName: string) {
    await this.page
      .getByLabel('Main navigation')
      .getByRole('link', { name: linkName })
      .click();
  }
  async clickFooterNavLink(linkName: string) {
    await this.page
        .getByLabel('Footer navigation')
        .getByRole('link', { name: linkName })
        .click();
}
}