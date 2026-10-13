import { Page, expect, Locator } from '@playwright/test';

export class BannerPage {
  constructor(private page: Page) {}

  private banner(message: string | RegExp): Locator {
    return this.page
      .locator('li[role="status"][data-state="open"]')
  }

  async verifyBannerText(message: string | RegExp): Promise<void> {
    const banner = this.banner(message);

    await expect(banner).toBeVisible();
    await expect(banner).toContainText(message, { timeout: 1000 });
  }

  async closeBanner(message: string | RegExp): Promise<void> {
    await this.banner(message)
      .locator('button[toast-close]')
      .click();
  }
}