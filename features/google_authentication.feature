Feature: Google Authentication
  All applications developed to work with Google require
  a authorized token to be used.  Our application keeps
  track of that.

Scenario: The authorize file is not found
  Given there isn't a .ga.auth.yaml file in the home directory
  When I successfully run `ga check`
  Then the stderr should contain "http://www.google.com"
  And the .ga.auth.yaml file should exist in the home directory
