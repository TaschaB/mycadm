module.exports = {
  default: {
    requireModule: ['ts-node/register'],
    require: [
      'src/support/**/*.ts',
      'src/hooks/**/*.ts',
      'src/stepDefinitions/**/*.ts'
    ],
    paths: ['features/**/*.feature'],
    format: [
      'summary',
      'html:reports/cucumber-report.html',
      'allure-cucumberjs/reporter'
    ],
    publishQuiet: true
  }
};