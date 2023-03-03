# SARS_CoV-2_Human_HPI

<h2>Aim of the project</h2>

This project aims to collect SARS-CoV-2 human protein protein interactions that are manually curated from literature.
Using a combination of keywords including 'SARS-CoV-2 human proteins interactome' on the Pubmed database, we obtained 126 results. 
We then proceeded with a first manual curation of abstracts to select articles that provided a list of SARS-CoV-2 human protein-protein interactions.
The selected articles were then retrieved and a second manual curation on the whole content of papers was performed by team members to retrieve all viral-host protein interactions. 
In total, 2989 interactions involving 33 SARS-CoV-2 proteins and 1483 human proteins were retrieved.
Based on the collected data, an R script using R shiny, visNetwork and shiny dashboard packages was built to retrieve data from generated csv files and display it on the web interface over the Web.
An in-house perl script was developed to make protein interactions in appropriate format. 

<h2>How it works</h2>
Collected data are available within the file "SARS-CoV-2_HPI.csv" highlighting the human host protein, the SARS-CoV-2 pathogen protein and the reference from which the information has been retrieved.
The content of this file was transformed to generate the contents of both files "nodes.csv" and "edges.csv"
The R script app.R uses the R packages shiny, visNetwork to build a shiny web interface and to display the interactions into a network

A user can type "R" in the terminal or open R studio
The content of the app.R can be copied and pasted on the terminal

<h2>Development</h2>
Scripts were developed by Kais GHEDIRA and are being optimised






