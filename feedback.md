# Project 2 Evaluation

## Technical Requirements
**3: Excelling**
>Includes many well-structured models, and advanced functionality such as authorization, 3rd-party API integration, or other technology not covered in class

## Creativity and Interface
**3: Excelling**
>The app is fully responsive, incorporates outside technologies such as Flexbox. App incorporates modern UI themes, and adds unique flair.

## Code Quality
**3: Excelling**
>No major code quality issues, makes use of Ruby best practices appropriately, and follows techniques such as separation of concerns, abstraction, and encapsulation

## Deployment and Functionality
**2: Performing**
>Application contains no major errors, is deployed correctly, and contains a custom Heroku app name appropriate for the app.

## Planning / Process / Submission
**2: Performing**
>Submission contains clear evidence of planning, adequate documentation, include all from previous category, as well as additional information such as unsolved issues.

### Notes

Great job on this project! The drafting mechanic was pretty neat.

The functionality seems to quit after drafting. It would be neat to have an
index view to show all of the created leagues and drill back into the teams/players.

Looks like you previously had Teams routes as /teams/:id/... whereas they now are nested under League /leagues/:league_id/teams/:id. This created problems with your team views and controller. See edits and comments in the code comments.

For drafting, you previously had the round variable stored in a global. This works well enough for a single league, but if exit a draft and go back to create a new league, the round counter won't reset. The index also gets lost if you navigate away and decide to revisit, for instance, /leagues/1/draft the previous "next" team is no longer shown as the next.

A better way to manage these two variables is to store them in the League object itself. This allows you to navigate away and back and still keep your state.

I also looked into your issue where each next round would skip the first team and came up with a solution by modifying your PlayersController and LeaguesController draft methods. Take a look.
