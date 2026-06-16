import { expect, Page, Locator } from '@playwright/test';
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
async footerNavigationShouldBeAccessible(): Promise<void> {
  const footerNavigation = this.page.getByLabel('Footer navigation');

  await expect(footerNavigation).toBeVisible();
  await expect(footerNavigation).toBeEnabled();
}
async verifyButtonIsVisible(automationKey: string): Promise<void> {
  await expect(
    this.page.locator(`[data-automation="${automationKey}"]`)
  ).toBeVisible();
}
}