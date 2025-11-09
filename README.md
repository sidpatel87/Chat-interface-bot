# Chat-interface-bot
Mybot. A Simple chatbot added to a HTML website

Website link
http://myweb.usf.edu/~spatel259/mybot.html

ISM 6225: AI Customer Analysis Bot
Course: ISM 6225 - App Dev for Analytics (University of South Florida)

Author: Siddharth Patel

This project is an end-to-end application that demonstrates the flow of data from a database to a live, AI-powered chatbot. The goal was to answer a specific business question using SQL, feed that data to an AI, and embed that AI into a public-facing webpage.

Project Components
This project consists of three main parts:
1. SQL Database Analysis
The first step was to analyze a sales/business database (24_ds.db) using SQLite.
Analytical Question: "What are the top 10 customers by number of orders placed?"
Assignment Constraint: The final query result had to include 4 additional columns for context, for a total of 5.

Final SQL Query (top_10_customers.sql):
/* What are the top 10 customers by number of orders placed? */
SELECT 
	customers.cno AS CustomerNumber,
	COUNT (sales_orders.order_no) AS 'NumberofOrders', 
	sum(sales_orders.amount) AS 'Total amount Spent', 
	customers.balance, 
	customers.cr_limit
FROM
	customers 
Inner JOIN 
	sales_orders
ON
	customers.cno =  sales_orders .cno
group by 
	customers.cno
Order By	
	NumberofOrders DESC
LIMIT 10

The 10-row result of this query was exported to top_10_customers.csv.

2. Botpress AI Chatbot
The exported top_10_customers.csv file was used as the sole Knowledge Base for an AI bot built in Botpress.
Knowledge: The .csv was imported into a Botpress Table named Top10CustomersTable, which was then used as the source for a new Knowledge Base (Bot knowledge base).
Bot Workflow: The bot uses a simple Start -> AutonomousNode flow.
Bot "Brain" (Instructions): The AutonomousNode was given a system prompt to act as a "Customer Analysis Bot" and to answer questions only using the 5 columns from its Knowledge Base.

3. HTML Webpage (mybot.html)
A simple webpage was created to serve as a user-friendly frontend for the bot.
This repository contains all the files for this webpage:
mybot.html, CSS, and image used. 

The page describes the project and embeds the live Botpress bot, which is accessible via the chat icon in the bottom-right corner.

Final Result
Chatbot deployed on a webpage. 
