import { When,Then, Given } from '@cucumber/cucumber';
import { SignInPage } from '../pages/signInPage';
import users from '../data/users.json';

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