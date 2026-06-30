Feature: Glue Code generation
#    script
    #    npx cucumber-js --tags "@glueCode" --dry-run

@glueCode
Scenario: Generate glue code 
Then the password should be visible in the password field 