# GMDWellframe
GMDWellframe is a code challenge for Wellframe. 
Required tasks: 
* Create a two-tab application
* 1st tab - Sectioned table with 3 sections
* 2nd tab - Bookmarked content.

## Tasks for 1st tab
### First header
* Name: Progress
Gets “steps taken” data from HealthKit and presents it to you in a pretty and coherent way in animated graphs using either Core Animation or a third party animation framework (e.g. Facebook POP) and displays encouraging messages based on level of activity. If there’s no data recorded on HealthKit, enable tracking and record some data.

### My approach
Implemented a custom cell that includes a custom attributed label that simulates the counting of the steps. Begins count at 0 and ends at the number of steps taken that day. If access to HealthKit was denied or there is no access,  you’re presented with an alert.

### Second header
* Name: Videos
Pull videos from a third party API. Display the video thumbnail previews + titles in a list. Tapping the video thumbnail should play the video. Should be able to bookmark videos.

### My approach
Used Vimeo’s Simple API to request a video JSON feed. Created custom cell for videos that includes video thumbnail, title and button to add bookmark.
Used AFNetworking for my third party library. 
Vimeo does not offer a direct URL to its videos and was unable to play the video using its URL. Used YTVimeoExtractor to request direct URL and used MediaPlayer framework to present video. 

### Third header
* Name: Articles
Pull articles from a third party API. Display the article titles in a list. Tapping an article title opens the article. Should be able to bookmark articles. Selecting the video from the tableview will play the selected video. 

### My approach
Used TED’s API to request a feed of TED events. Created custom cell as well to display title. When title is selected, you are taken to a detail view that shows the article’s title and description. The title is represented as a UILabel and the description in a UITextView. 

Implemented a add button to the navigation bar and used CoreData to save the article to the bookmarks tap when the button is pressed. When button is pressed you will also be presented with an alert advising bookmark has been added. 

## Tasks for 2nd tab
Should display a list of all bookmarked content. This list of bookmarked content should be locally persisted with Core Data and bookmarked content should be reflected in the 1st tab (e.g the articles and videos should have an indicator of being bookmarked).

### My approach
Created a CoreData model with the necessary managed objects. Utilized an NSManagedObject and using NSFetchResultsController fetched and displays all the bookmarks in a tableview. 

Added extra functionality to swipe to delete the row.

The app should also handle no/bad network conditions appropriately from a UI perspective.

### My approach
Used Tony Million’s Reachability Library. 

### Unfinished: 
I failed to complete the progress bar that was going to be displayed in the background of the StepCell. It’s progress would cause to increase in size from left to right until reaching the right side of the screen representing 100% completion of the set goal. I did not implement the goal controller to set the step goal, hence did not finish the progress bar. 
