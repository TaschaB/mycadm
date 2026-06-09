import { Given } from '@cucumber/cucumber';
import { CustomWorld } from '../support/world';

Given('I open the MyCADM homepage', async function (this: CustomWorld) {
  await this.page.goto('https://mycadm.com/');
});