import { Page, expect, Locator } from '@playwright/test';

export class BannerPage {
  constructor(private page: Page) {}

  private bannerWithText(message: string | RegExp): Locator {
    return this.page
      .locator('li[role="status"][data-state="open"]')
      .filter({ hasText: message });
  }

  async verifyBannerText(message: string | RegExp): Promise<void> {
    const banner = this.bannerWithText(message);

    await expect(banner).toBeVisible();
    await expect(banner).toContainText(message);
  }

  async closeBanner(message: string | RegExp): Promise<void> {
    await this.bannerWithText(message)
      .locator('button[toast-close]')
      .click();
  }
}