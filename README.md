# WQD7001: Group project
## Introduction
Our project will focus on bringing together a number of datasets, containing geolocation information, via an interactive map. This will allow users to easily explore a geographic area of interest using an intuitive graphical interface.

## Target audience
Our target audience is mainly newcomers to the city(like international students, foreign workers) who rarely holds idea about city's significant required concerns like housing, transportation, grocery etc. In particular, those who are currently located in Malaysia.

## Dataset(s)
| Dataset description        | Source(s) | Owner    |
|----------------------------|-----------|----------|
| Available house rentals    |           | Maira    |
| Public transportation      |           | Meheruna |
| Crime                      |           | Owen     |
| Grocery/supermarket stores |           | Resmy    |
| Restaurants etc.           |           | ?        |

## User input
The main user input will be their selection of a geographic area of interest, via an graphical map.

## Contributing
```bash
> git clone https://github.com/bright-science/WQD7001-group-project.git
> cd WQD7001-group-project

# ... make your changes ...

> git add --all
> git status
> git commit -m "What does this change do?"
> git push
```

## Running the R-Shiny application
### R Studio
- Using "File > Open File", locate the project directory (i.e. where you cloned code from GitHub) and open either of the following files ...
```
global.R
UI.R
server.R
```
- In the R Studio interface, find the "Run App" button (it should be at the top-right of the code window you have opened).
- Click the small downward arrow to drop-down a menu.
- Select "Run In Viewer Pane" (and a new "Viewer" pane should open).
- Now click the "Run App" button to run the application.
- You should see the application interface in the "Viewer" pane.