import { When,Then } from '@cucumber/cucumber';
import { CustomWorld } from '../support/world';

When(
  'I click {string} button',
  async function (this: CustomWorld, automationKey: string) {

    await this.page
      .locator(`[data-automation="${automationKey}"]`)
      .click();
  }
);