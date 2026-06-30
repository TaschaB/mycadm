import { When,Then, Given } from '@cucumber/cucumber';
import { SignInPage } from '../pages/signInPage';
import users from '../data/users.json';
import { Dialog, expect } from '@playwright/test';

When('I sign in with a invalid password', async function () {
  const signInPage = new SignInPage(this.page);

  await signInPage.login(
    users.validUser.username,
    users.invalidUser.password
  );
});

When('I sign in with a invalid username', async function () {
  const signInPage = new SignInPage(this.page);

  await signInPage.login(
    users.invalidUser.username,
    users.validUser.password
  );
});

When('I sign in with a invalid credentials', async function () {
  const signInPage = new SignInPage(this.page);

  await signInPage.login(
    users.invalidUser.username,
    users.invalidUser.password
  );
});

When('I sign enter only password', async function () {
      const signInPage = new SignInPage(this.page);

  await signInPage.enterPassword(
    users.invalidUser.password
  );
  await signInPage.clickSignIn();

});

When('I sign enter only username', async function () {
      const signInPage = new SignInPage(this.page);

  await signInPage.enterUsername(
    users.invalidUser.password
  );
  await signInPage.clickSignIn();

});

When('I sign enter leading username', async function () {
      const signInPage = new SignInPage(this.page);

await signInPage.login(
  users.validUsernameLeadingSpace.username,
  users.validUser.password
);
});

When('I sign enter trailing username', async function () {
      const signInPage = new SignInPage(this.page);

await signInPage.login(
  users.validUsernameTrailingSpace.username,
  users.validUser.password
);
});

When('I sign enter leading password', async function () {
      const signInPage = new SignInPage(this.page);

await signInPage.login(
  users.validUser.username,
  users.validUsernameLeadingSpace.password
);
});

When('I sign enter trailing password', async function () {
      const signInPage = new SignInPage(this.page);

await signInPage.login(
  users.validUser.username,
  users.validUsernameTrailingSpace.password
);
});

When('I sign in as {string}', async function (userKey: string) {
  const signInPage = new SignInPage(this.page);

  const user = users[userKey as keyof typeof users];

  if (!user) {
    throw new Error(`User test data not found for key: ${userKey}`);
  }

  await signInPage.login(user.username, user.password);
});

Given('I am watching for browser dialogs', async function () {
  this.dialogAppeared = false;

this.page.on('dialog', async (dialog: Dialog) => {
    this.dialogAppeared = true;
    await dialog.dismiss();
});
});

Then('no browser dialog should appear', async function () {
  expect(this.dialogAppeared).toBe(false);
});

When('I enter a password into the password field', async function () {
  const signInPage = new SignInPage(this.page);

  await signInPage.passwordOnly(
  users.validUsernameTrailingSpace.password
);
});

When('I click the Show password toggle', async function () {
await this.page.getbylabel('Show password').click();
});

Then('the password should be visible in the password field', async function () {
  const signInPage = new SignInPage(this.page);

  await signInPage.expectPasswordToBeVisible();
});