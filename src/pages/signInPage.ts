import { Page, expect } from '@playwright/test';
import { BasePage } from './basePage';

export class SignInPage extends BasePage {
  constructor(page: Page) {
    super(page);
  }

  async enterUsername(username: string): Promise<void> {
    await this.page.getByLabel('Username').fill(username);
  }

  async enterPassword(password: string): Promise<void> {
    await this.page.getByLabel('Password').fill(password);
  }

  async clickSignIn(): Promise<void> {
    await this.page.getByRole('button', { name: 'Sign in' }).click();
  }

  async login(username: string, password: string): Promise<void> {
    await this.enterUsername(username);
    await this.enterPassword(password);
    await this.clickSignIn();
  }
}