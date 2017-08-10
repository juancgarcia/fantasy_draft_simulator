# Fantasy Football Draft Helper

The Fantasy Football Draft Helper allow user to practice fantasy football drafts.
Users can test different strategies and research players

The app is built with Ruby on Rails and contains three tables: Players, Teams, and Leagues.

General Approach:
* Drafts happen for leagues, where players are assigned to teams.  There therefore, leagues have a one to many relationship with teams.
Within a league, players have a one to many relationship with teams, however, because all teams are stored in one table, teams and players have a many to many relationship.
In order to create relationships between leagues, teams, and drafted players, player routes are nested into team routes which are nested into leagues.

Challenges:
* The draft action was the most difficult part of this project and consume the majority of the work time.  This led to a limited set of features being implemented.
* The draft order remains an issue.  While the order follows a proper snake draft (1 -> 12 then 12 -> 1), the first and last teams are not able to draft twice in a row at the beginning of a round.

Feature Roadmap:
* User models for saving and reviewing past Drafts
* Drafting against the computer
* Positional requirements for each team
* Customizable league formats (number of teams, scoring)
* More player data and status
* Uploading of custom player rankings
