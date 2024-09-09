# Fetch Coding Challenge - SwiftUI

### Summary:
Please write a native iOS app that allows users to browse recipes using the following API:
https://themealdb.com/api.php
There are 2 endpoints that your app should utilize:
https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the Dessert category.
https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID.
The user should be shown the list of meals in the Dessert category, sorted alphabetically.
When the user selects a meal, they should be taken to a detail view that includes:

* Meal name
* Instructions
* Ingredients/measurements

Please read the following guidelines carefully before starting the coding challenge:

* Asynchronous code must be written using Swift Concurrency (async/await).
* Be sure to filter out any null or empty values from the API before displaying them.
* UI/UX design is not what you’re being evaluated on, but the app should be user friendly and should take basic app design principles into
account.
* Your project should compile using the latest version of Xcode.

## Assumptions:

1.  Recipe JSON objects from TheMealDB may have ingredients that do not have corresponding measurments (either empty String, or nil), but
measurements will be ignored if they do not have a corresponding ingredient.
2.  Recipe JSON object must have both a name and an id, otherwise they are considered invalid.
3.  Recipe details JSON object must have id, category, and instructions, otherwise it is considered invalid.

## Future Improvements:

1.  Add retry and refresh logic.
2.  Add persistence logic to reduce the number of calls made to TheMealDB API.
