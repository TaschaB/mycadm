import { Before, After, Status } from '@cucumber/cucumber';
import { chromium, firefox, webkit, BrowserType } from '@playwright/test';
import { CustomWorld } from '../support/world';

const getBrowserType = (): BrowserType => {
  const browserName = process.env.BROWSER?.toLowerCase() || 'chromium';

  switch (browserName) {
    case 'firefox':
      return firefox;
    case 'webkit':
      return webkit;
    case 'chromium':
    default:
      return chromium;
  }
};

Before(async function (this: CustomWorld) {
  const browserType = getBrowserType();

  this.browser = await browserType.launch({
    headless: false,
    args: process.env.BROWSER === 'chromium' || !process.env.BROWSER
      ? ['--start-maximized']
      : []
  });

  this.context = await this.browser.newContext({
    viewport: null
  });

  this.page = await this.context.newPage();

  this.page.on('response', async (response) => {
    const status = response.status();

    if ([400, 401, 403, 404, 500, 502, 503, 504].includes(status)) {
      this.serverErrors.push(
        [
          'Server error detected',
          `Status: ${status}`,
          `Method: ${response.request().method()}`,
          `URL: ${response.url()}`
        ].join('\n')
      );
    }
  });
});

After(async function (this: CustomWorld, scenario) {
  if (this.serverErrors.length > 0) {
    await this.attach(
      `Severe server errors found:\n\n${this.serverErrors.join('\n\n---\n\n')}`,
      'text/plain'
    );
  }

  if (scenario.result?.status === Status.FAILED && this.page) {
    const screenshot = await this.page.screenshot({ fullPage: true });
    await this.attach(screenshot, 'image/png');
  }

  await this.page?.close();
  await this.context?.close();
  await this.browser?.close();
});