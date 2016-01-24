shinyUI(
    navbarPage("SwiftKey Capstone",id="nav",
        tabPanel("Application",tags$head(includeCSS("styles.css")),
                tabsetPanel(type="tabs",
                    tabPanel("Predictor",
                        fluidRow(
                            column(4,
                                wellPanel(
                                    h4("Word Predictor"),
                                    helpText("Type a word or phrase, the app will predict the next word."),
                                    textInput("text",label="Text input",value="Teenage mutant ninja "),
                                    numericInput("num",label="Words to predict:",value=3,min=1,max=5),
                                    checkboxInput("choice",label="Shakespearean",value=FALSE),
                                    hr(),
                                    wellPanel(
                                        HTML('<small><p align="justify"',
                                            markdownToHTML(fragment.only=TRUE, text=c("The data `loads automatically,` predictions will be `processed as you type.`
                                                                        \n`Word predictor:` Type a word or phrase followed by a `space` the app will predict the `next word.`
                                                                        \n `Word corrector`: If `no space` is typed after the phrase, the app will provide options for the `current word.`
                                                                        \n `- Words to predict:` Select the `number of predictions & corrections` the app will serach for.
                                                                        \n `- Shakespearean:` Select to predict like the `Bard of Avon,` it affects also the generator.
                                                                                    ")
                                                                                ),
                                                            "</small></p>"),
                                    hr(),
                                        HTML('<table border ="0" width="80%">
                                            <tr><td><font color= "#999999">Code by <b>Luis E Castro</b></td>
                                            <td><a href="mailto:luis.quiros@gmail.com"><img src="gmail.gif"></a>&nbsp;</td>
                                            <td><a href=https://twitter.com/luis_lundquist><img src="twitter.png"></a>&nbsp;</td> 
                                            <td><a href=https://linkedin.com/in/luisquiros><img src="linkedin.gif"></a>&nbsp;</td>
                                            <td><a href=https://github.com/luislundquist><img src="github.png"></a>&nbsp;</td></tr></table>
                                            ')
                                            )
                                        )
                                    ),
                            column(4,
                                h4("Predictor"),
                                hr(),
                                h6("List of top results:"),
                                wellPanel(span(textOutput("value"),style="color:#000000")),
                                h6("The phrase you typed:"),
                                wellPanel(span(textOutput("current"),style="color:#999999"))
                                ))),
                    tabPanel("Generator",
                        fluidRow(
                            column(4,
                                wellPanel(
                                    h4("Phrase Generator"),
                                    helpText("Type a word or phrase, the app will generate a phrase based on it."),
                                    textInput("seed",label="Text input",value="She was so "),
                                    numericInput("rand",label="Randomness of prediction:",value=3,min=1,max=5),
                                    numericInput("size",label="Length of the phrase:",value=5,min=1,max=10),
                                    actionButton("go","Generate",width='100px'),
                                    hr(),
                                    wellPanel(
                                        HTML("<small><p align='justify'>",
                                            markdownToHTML(fragment.only=TRUE, text=c("`Generator:` Generate `random phrases` according to the input parameters `'text'`, `'randomness'` and `'length of phrase'`.
                                                                                    \n Press `Generate` to generate `new phrase.`")),
                                            markdownToHTML(fragment.only=TRUE, text=c("`- Input text:` Word or phrase that will be the `start` of the generated phrase, `can be left empty.`
                                                                                    \n `- Randomness:` Number of results to randomly choose from for each generated word, if `equal to 1` will always choose the `top choice.`                  
                                                                                    \n `- Length of phrase:` Number of `additional words` the phrase will have."
                                                                                    )
                                                                                ),
                                                                    "</p></small>"
                                                                            ),
                                    hr(),
                                    HTML('<table border ="0" width="80%">
                                        <tr><td><font color= "#999999">Code by <b>Luis E Castro</b></td>
                                        <td><a href="mailto:luis.quiros@gmail.com"><img src="gmail.gif"></a>&nbsp;</td>
                                        <td><a href=https://twitter.com/luis_lundquist><img src="twitter.png"></a>&nbsp;</td> 
                                        <td><a href=https://linkedin.com/in/luisquiros><img src="linkedin.gif"></a>&nbsp;</td>
                                        <td><a href=https://github.com/luislundquist><img src="github.png"></a>&nbsp;</td></tr></table>
                                        ')
                                    )
                                )
                             ),
                        column(4,
                            h4("Generator"),
                            hr(),
                            h6("The phrase generated:"),
                            wellPanel(span(textOutput("babble"),style="color:#000000")),
                            h6("The phrase you typed:"),
                            wellPanel(span(textOutput("phrase"),style="color:#999999"))
                            )
                        )
                    )
                )
            ),

        tabPanel("Workflow",tags$head(includeCSS("styles.css")),
            tabsetPanel(type="tabs",
                tabPanel("Data Handling",
                    fluidRow(
                        column(4,
                            wellPanel(
                                h4("Prologue"),p("After using and testing diverse NLP R libraries, performing exploratory analysis 
                                                of data and immersing into the literature of natural language processing, the flow 
                                                (images on the right) which will be described was envisioned.",align="justify"),
                                                p("The functions used on this project are homebrew, not due to the lack of excelent libraries",code("RWeka,NLP,tm,ngram"),"
                                                or their performance (although some did crash at times), but because of the need to know what was under 
                                                the hood for this kind of application. All are available at",
                                                a("GitHub",href="https://github.com/luislundquist/NLP_Capstone"),"for reference.",align="justify"),
                                                hr(),
                                                p(helpText("The following tabs are a guide to sequentially understand the development of 
                                                the app, from the early stages of cleaning and preparing the data to the code in the app and the considerations taken in it."),align="justify"),
                                                hr(),
                                                wellPanel(
                                                    HTML('<table border ="0" width="80%">
                                                        <tr><td><font color= "#999999">Code by <b>Luis E Castro</b></td>
                                                        <td><a href="mailto:luis.quiros@gmail.com"><img src="gmail.gif"></a>&nbsp;</td>
                                                        <td><a href=https://twitter.com/luis_lundquist><img src="twitter.png"></a>&nbsp;</td> 
                                                        <td><a href=https://linkedin.com/in/luisquiros><img src="linkedin.gif"></a>&nbsp;</td>
                                                        <td><a href=https://github.com/luislundquist><img src="github.png"></a>&nbsp;</td></tr></table>
                                                        ')
                                                    )
                                                )
                                            ),
                        column(8,
                            h3("Data handling and preparation"),
                            hr(),
                            p(img(src="data_handling.png"),align="center"),hr(),
                            h4("Data flow: From raw data to frequency tables."),hr(),
                            p("There were 5 stages of data from raw data as provided in the Coursera Capstone, to frequency tables, the sort used for the
                            NLP prediction app."),
                            p(strong("1. Raw Data: "),"Data acquired from 3 sources: ",
                              a("blogs, news and twitter",href="https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"),".",
                            " Each with different characteristics (length of sentences, use of words, encoding, etc). For donwloading and loading the data were defined:",code("downloader(), loader().")),
                            p(strong("2. Preprocessing: "),"Afterwards, proceed to clean the text. Remove extra 
                            spaces, punctuation, symbols and numbers, transform everything to lower case and to the same encoding.
                            For that were used:",code("pre(), pos().")),
                            p(strong("2.5 Condition: "),"An in between process before creating the ngrams, here text is  tagged with the start and stop of each sentence. The function used was:",code("condition().")),
                            p(strong("3 Ngrams: "),"The core transformation, the ngrams are the building links of the sentences. 
                            Bigger ngrams are more specific but also more rare. Ngrams are created, that is, secuences of consecutive n words. For that purpose:",code("ngram().")),
                            p(strong("4 Frequency count: "),"Once created the ngrams, it is necesary to count them so to know which are more frequent, which have higher probability of appearing on
                            the text. Was done individually for each ngram rank. Code used: ",code("tgram().")),
                            p(strong("4.5  Trim: "),"Examine the frequency tables, searching for frecuency of frecuencies, skewness and presence of elements better removed, it's easier to appreciate this
                            with summarized data as it is now. To do this:",code("trim(), tester(), reducer().")),
                            p(strong("5  Frequency tables: "),"The resulting tables are the processed data to be used in the app. ")
                            ))),
         
        tabPanel("App operation",
            fluidRow(
                column(4,
                    wellPanel(
                        h4("Speed & Accurancy"),
                            p("Tackling those questions before the project, and periodically during it provides a beneficial control loop.",
                            code("speed & accurancy")," are both desired traits, as is too the sometimes overlooked",
                            code("user interface."),align="justify"),
                            p("Here we take a look at the functions that make the app, they are explained as are their interactions."),
                            p("For this development and perhaps for any development, there are 
                              important question that need to addressed, some of them are:",align="justify"),
                            helpText("- What computational resources (memory, processing power, storage) are available to prepare the data?"),
                            helpText("- What is timeframe for delivery?"), 
                            helpText("- What omputational resources the user will have?"),
                            helpText("- Who is our user? What is he/she expecting? What those he/she need?"),
                            helpText("- Is it easy to upgrade and improve?"),
                            hr(),
                            wellPanel(
                                HTML('<table border ="0" width="80%">
                                     <tr><td><font color= "#999999">Code by <b>Luis E Castro</b></td>
                                     <td><a href="mailto:luis.quiros@gmail.com"><img src="gmail.gif"></a>&nbsp;</td>
                                     <td><a href=https://twitter.com/luis_lundquist><img src="twitter.png"></a>&nbsp;</td> 
                                     <td><a href=https://linkedin.com/in/luisquiros><img src="linkedin.gif"></a>&nbsp;</td>
                                     <td><a href=https://github.com/luislundquist><img src="github.png"></a>&nbsp;</td></tr></table>
                                     ')
                                    )
                                )
                            ),
                 column(8,
                    h3("App operation and algorithms"),
                    hr(),
                    p(img(src="workflow.png"),align="center"),hr(),
                    h4("User input processing and app output result."),hr(),
                    p("This description is about the project as requested in the Capstone, additional characteristics are elsewhere."),
                    p(strong("1. User input: "),"The user types a word or phrase in the input box, it is pre processed 
                    (see 2. Preprocessing in the previous tab), and the last two (or three) are passed to the following function, so are
                    the frequency tables. The code for this and the rest of the functions is contained within ",code("global.R"),", 
                    function used:",code("pre().")),
                    p(strong("2. Streamer: "),"Data is then passed to the streamer, the function decides if the user has 
                    finished typing the last word, if so, prepares data to predict the next word, if not, to predict the current one, 
                    function used.",code("streamer().")),
                    p(strong("3.1 Predictor: "),"Takes the input's last two words an looks up for them in the 3gram table, if 
                    found returns the top probability words to follow them, if not found, looks up for the last word in the 2gram table and repeats the process, 
                    if not found, returns the top ranked 1grams. Function",code("predictor().")),
                    p(strong("3.2 Corrector: "),"This function takes the input last two words and the fragment of the 3rd word (define by the presence or not of 
                    a whitespace after the last word), in looks up for the first two in the 3gram table, if found, looks up for the 3rd word most similar to the fragment typed, 
                    does the same for the 2gram and the 1gram and returns the best match. Function",code("corrector().")),  
                    p(strong("4 Result: "),"The top results for the input are displayed on screen.") 
                    )
                )
            ),
         
         
        tabPanel("Main Concepts",
            fluidRow(
                column(4,
                    wellPanel(
                        h4("Foundations"),
                        p("Main concepts for developing this Natural Language Prediction app:",
                        code("Markov chain & Back-off model"),"
                        are briefly explained here. Used also for the Corrector is the ",code("Levenshtein edit distance."),align="justify"),
                        p("Worth of notice is the role",code("regular expressions"),"play in NLP, as the main tools used to 
                        prepare and format the text.",align="justify"),
                 p("Further information of NLP relevant tools and algorithms, considerations on digits and punctuation, text case and others can be found at 
                 the Resources tab."),
                 hr(),
                 wellPanel(
                     HTML('<table border ="0" width="80%">
                     <tr><td><font color= "#999999">Code by <b>Luis E Castro</b></td>
                     <td><a href="mailto:luis.quiros@gmail.com"><img src="gmail.gif"></a>&nbsp;</td>
                     <td><a href=https://twitter.com/luis_lundquist><img src="twitter.png"></a>&nbsp;</td> 
                     <td><a href=https://linkedin.com/in/luisquiros><img src="linkedin.gif"></a>&nbsp;</td>
                     <td><a href=https://github.com/luislundquist><img src="github.png"></a>&nbsp;</td></tr></table>
                     ')
                    )
                )
            ),
                      
                column(8,
                    h3("Main concepts and considerations"),
                    hr(),
                    h4("Markov chain"),
                    p(code("Markov chain,"),"an approximation of the probability of selecting a word by using all the previous words 
                    that can be made by just using the n previous words.",justify="align"),
                    p(img(src="markov.png"),align="center"),
                    h4("Back-off model"),hr(),
                    p(code("Back-off model"),"select the word with highest probability to appear given the previous word(s), 
                    if those words are not found in the text, go to the next lower grade n-gram table and repeat the search with one less word.",align="justify"),
                    p(img(src="backoff.png"),align="center"),
                    h4("Levenshtein distance"),hr(),
                    p(code("Levenshtein distance"),"searches for a pattern, calculating the number of insertions, deletions or 
                    substutions of characters needed for one word to become another, the lower the distance the more 'alike' such words are. 
                    R function:",code("agrep()"),align="justify"),
                    p(img(src="lev.png"),align="center")
                    )
                ) 
            ),
         
         tabPanel("Resources",
            fluidRow(
                column(4,
                    wellPanel(
                        h4("Literature"),
                            p(code("Natural Language Processing"),"Is a huge and interesting topic that rapidly develops as interactions 
                            between Human-Computer aim to become seamless. Linguistics, statistics, probabilistic models and many 
                            other subjects crossbreed. ",code("Translation, prediction, sentiment analysis, 
                            summarization"),"are some of the branches that outreach to our everyday lives. 
                            Following is a list of links and information (by no means comprehensive) to start dwelling in it"),align="justify"),
                            hr(),
                                wellPanel(
                                     HTML('<table border ="0" width="80%">
                                        <tr><td><font color= "#999999">Code by <b>Luis E Castro</b></td>
                                        <td><a href="mailto:luis.quiros@gmail.com"><img src="gmail.gif"></a>&nbsp;</td>
                                        <td><a href=https://twitter.com/luis_lundquist><img src="twitter.png"></a>&nbsp;</td> 
                                        <td><a href=https://linkedin.com/in/luisquiros><img src="linkedin.gif"></a>&nbsp;</td>
                                        <td><a href=https://github.com/luislundquist><img src="github.png"></a>&nbsp;</td></tr></table>
                                        ')
                                    )
                                ),
                      
                column(8,
                    h3("Relevant information"),
                    hr(),
                    p(img(src="regular_expressions.png"),align="center"),
                    hr(),
                    p("- ",a("Coursera NLP",href="https://www.coursera.org/course/nlp")," A must for anyone who wants to learn about Natural
                    Language Processing, taught by two NLP heavyweights, Dan Jurafsky and Christopher Manning. Jurafsky also has a great 
                    book on the topic 'Speech and language processing.",align="justify"),
                    p("- ",a("Peter Norvig's website",href="http://norvig.com/ngrams/"),"Peter Norvig is a big name in AI, and has a very 
                    non-trivial job as Head of Research at Google. He has text corpus in his webpage as well as code and many interesting things.",align="justify"),
                    p("- ",a("Empirical Study of Smoothing Techniques",href="http://www.speech.sri.com/projects/srilm/manpages/pdfs/chen-goodman-tr-10-98.pdf"),
                    "Old but interesting paper."),
                    p("- ",a("RStudio Shiny Gallery",href="http://shiny.rstudio.com/gallery/"),"A must to start learning Shiny on R",align="justify"),
                    p("- ",a("Ivan Liu",href="https://github.com/ivanliu1989/SwiftKey-Natural-language"),"I learned a lot by reading his code, 
                    great complement to the RStudio Shiny Gallery",align="justify"),
                    p("- ",a("A model to predict words",href="http://www.modsimworld.org/papers/2015/Natural_Language_Processing.pdf"),
                    "An interesting document precisely of the project at hand.",align="justify"),
                    p("- ",a("xkcd",href="https://xkcd.com/"),"If you need a laugh to keep you going. I have found two comic strips quite 
                    related to the subject",a("regex",href="https://xkcd.com/208/"), "&" ,a("SwiftKey.",href="https://xkcd.com/1068/"),align="justify"),
                    p("- ",a("NLP_Capstone GitHub",href="https://github.com/luislundquist/NLP_Capstone.git"),"This project's documentation on GitHub",align="justify")
                    )
                  ) 
                )
            )
         ),

        tabPanel("Data Exploration",tags$head(includeCSS("styles.css")),
                    includeMarkdown("beta2.md")
                )                
            )
        )
