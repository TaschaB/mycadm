import { Page, expect } from '@playwright/test';
import { BasePage } from './BasePage';

export class SignInPage extends BasePage {
  constructor(page: Page) {
    super(page);
  }

  async enterUsername(username: string): Promise<void> {
    await this.page.getByTestId('app.auth.form.email.input').fill(username);
  }

  async enterPassword(password: string): Promise<void> {
    await this.page.getByTestId('app.auth.form.password.input').fill(password);
  }

  async clickSignIn(): Promise<void> {
    await this.page.getByTestId('app.auth.button.signin').click();
  }

  async login(username: string, password: string): Promise<void> {
    await this.enterUsername(username);
    await this.enterPassword(password);
    await this.clickSignIn();
  }

    async passwordOnly(password: string): Promise<void> {
    await this.enterPassword(password);
}
async expectPasswordToBeVisible(): Promise<void> {
  const passwordInput = this.page.getByTestId('app.auth.form.password.input');

  await expect(passwordInput).toHaveAttribute('type', 'text');
}
}