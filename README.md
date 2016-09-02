# NLP text prediction / correction
## Coursera Capstone Project

This project was created by extracting information from a great corpora of Tweets, Blogs and News. This data was processed to have an understanding of the association of the words and their frequency. The aim is to be able to predict the next word that will be typed (specially useful while using mobile devices). It can also correct the words being typed, using the edit distance to propose a word substitution. Finally, with the same tecniques the corpora of Shakespeare was processed, allowing the user to switch the previous functions and predict using Shakespeare's words.

- *application->predictor tab:* Text input to generate next words, user can select how many options to predict, as well as switch from the common corpora to Shakespeare's one.
- *application->predictor tab:* The generator tab takes a text as input and then generates a phrase after it. It receives how many words the phrase after will be and the randomness of prediction, that is, from how many words select the phrase (if 1 for example, the top following word will be used, if 5, the 5 top words randomly selected)
- *Workflow:* This tabs show the thinking process, theoretical background and resources used to create the project.
- *Data exploration:* Shows the statistics of the corpora, manimulation methods, etc.

Files description:
- **ui.R**: is the user interface configuration, it sets how the app is visualized and interacted with.
- **functions.R:** All functions used and needed for the project, from preparing data to inside app algorithms.
- **data_handling.R:** Sequence of transformations from raw data to process data used by the app.
- **global.R:** Helper file for the app, here the functions are contained and called by server.R
- **server.R:** Receives inputs from ui.R processes them with global.R functions and returns the results to ui.R for display
- **beta2.md:** File of the data exploration milestone project included inside the app.
- **capstone2.Rpres:** App presentation and description
