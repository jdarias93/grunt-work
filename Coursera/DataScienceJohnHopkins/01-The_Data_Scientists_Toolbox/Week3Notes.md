# Types of Data Science Questions
## Descriptive
* First kind of analysis performed, commonly applied to census data
* Purely a description of what's going on.

## Exploratory
* Exploratory models are good for discovering new connections
* Useful for defining future studies but should not be used for generalizing/predicting.
* Correlation does not imply causation

## Inferential
* Goal: Use small data sample to say something about a larger population
* Commonly the goal of statistical model

## Predictive
* X predicts Y (not causes)
* More data and a simple model works the best
* Accurate prediction depends heavily on measuring right variables

## Causal
* Goal: To find out what happens to one variable when you make another change
* Gold Standard: Randomized studies required to ID causation
* Causal relationships are usually ID'd as average effects, but may not apply to every individual

## Mechanistic
* Goal: Understand the exact changes in variables that lead to changes in other variables for individual objects
* Incredibly hard to infer
* Usually modeled by deterministic set of equations (Physical/Engineering Science)
* The random component is typically measurement error
* If equations are known, but parameters are not, they may be inferred with data analysis

# What is Data?
## Definition
* Data are values of qualitative or quantitative variables, belonging to a set of items (population)

## What do data look like?
* Fastq files
* API files: a structured form of data
* Medical records: Functionally created to make analysis easier
* Spreadsheets
* Audio

## Data is the second most important thing
* The most important thing in data science is the question you are trying to answer

# What about big data?
* Data may not contain the answer if it is not the right data.

# Experimental Design
* Know and care about the anaylsis plan. It is critically important that you know the statistical method in the end game.
* Have a plan for data and code sharing
* Formulate your question in advance
* Confounding variables: "Hidden" variables that may effect two variables you have decided are correlated.

## Randomization and blocking
* Fix, stratify, or randomize variables

## Prediction V. Inference
* Sometimes you need a large enough divide between sets of data in order to make an accurate prediction

## Prediction Key Quantities
* Sensitivity: True Positive
* Specificity: True Negative
* Positive Predictive Value: Probability you have a disease given a positive test (what you would want to know at the Doctor's office)
* Negative Predicitve Value: Probability you have no disease given a negative test
* Accuracy: True Positives + Negatives / All Predictions

## Data Dredging
* Trying a billion different treatments until you get a "good" result.
