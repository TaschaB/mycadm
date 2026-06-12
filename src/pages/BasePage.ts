import { Page } from '@playwright/test';

export abstract class BasePage {
    constructor(protected page: Page) {}

    async clickNavigationLink(linkName: string) {
        await this.page
            .getByRole("link", { name: linkName })
            .click();
    }
    async dismissCookieBannerIfVisible() {
    const declineButton = this.page.getByRole('button', { name: /decline|reject|deny|no thanks/i });

    if (await declineButton.isVisible().catch(() => false)) {
        await declineButton.click();
    }
}

}

