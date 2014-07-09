Drafter
=======

User Stories:
*As a basic user, I want to hit the easy draft option and have my draft start with standard draft settings as defined by ESPN so that I can get a quick suggestion without much work.
*As a basic user, I want to have my roster displayed near the top of the page so I can see who is on my team.  I want all of my players to have links on their name so that I can read more about the player I picked.
*As a basic user, I do not want to have to add players to other teams - I only want to have to mark them as drafted so that I do not have to keep track of who the other teams are drafting.

Back-log (for more advanced players):
* As a user, I want to pick from different draft strategies so I can feel like I've made part of the decision.
* As a user, I want to put the players who have been drafted into the team that drafted them.
* As a user, I want a picture of the player who is being suggested.
* As a user, I want stats about the player who is being suggested.
* As a user, I want a small selection for my next pick.
* As a user, I do not want to navagate away from the page as the draft is underway.
* As a user, I want to receive an email with my draft recap.
* As a user, I do not want to have to scroll through a large page of players. I would rather have a small box to select from.
* As a user, I want to select the best available player at each position.
* As a user, I want to choose between beer sheets, ESPN, Yahoo or other experts to get the best available suggestion. I do not want my draft to be affected while I search through the different rankings.
* As a user, I want to see a "worst available" selection that can filter between some of the worst players in the league such as Aaron Hernandez or some retired players.

Other Stories:
* As a site admin, I want to login to edit player information to keep all players up to date.

Logic in drafting:
========
* Possible bye-week trouble
* Target one bye-week strategy
* ECR
* Beer-shees
* VBD

BUGS
====
* Best available player not working in Rails
* Second best available player not working in Rails
* Need to create draft through ajax after settings have been entered


Current User Story:
===================
* I want to receive a recommendation of the best player available.

-> Programmer notes: current strategy to show the best players is split into 4 different functions.  This does not seem DRY.  Today will be spent in attempt to refactor the code.
