import { readdirSync, readFileSync } from 'fs';
import { join } from 'path';

interface AllureResult {
  name: string;
  status: string;
}

const resultsDirectory = 'allure-results';

const files = readdirSync(resultsDirectory);
const resultFiles = files.filter(file => file.endsWith('-result.json'));

const results = resultFiles.map(file => {
    const filePath = join(resultsDirectory, file);
    const fileContents = readFileSync(filePath, 'utf-8');
    return JSON.parse(fileContents) as AllureResult;
});

const passed = results.filter(result => result.status === 'passed');
const failed = results.filter(
  result => result.status === 'failed' || result.status === 'broken'
);
const skipped = results.filter(result => result.status === 'skipped');  

console.log('Test Results');
console.log('------------');
console.log(`Total: ${results.length}`);
console.log(`Passed: ${passed.length}`);
console.log(`Failed: ${failed.length}`);
console.log(`Skipped: ${skipped.length}`);