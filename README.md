# AI Knowledge Bases and Queries in Prolog

## Overview

This project contains multiple **Prolog-based AI knowledge bases** and **query sets** created as part of an academic **Artificial Intelligence course assignment**.  
The domains covered include **banking systems (accounts, balances, transactions)** and a **RoboCup robot soccer simulation (passing and scoring rules)**.  

The project demonstrates the use of **logic programming in Prolog** for:  
- Representing facts and relationships as knowledge bases (KB).  
- Defining rules for reasoning.  
- Writing queries to extract meaningful answers.  
- Running interactions that simulate real-world scenarios.  

---

## Table of Contents
- [Project Description](#project-description)
- [Knowledge Bases](#knowledge-bases)
- [Queries](#queries)
- [Results](#results)
- [Technologies Used](#technologies-used)
- [Usage](#usage)

---

## Project Description

The assignment is divided into three main tasks:

1. **Bank Knowledge Base (Q1)**  
   - Models people, cities, accounts, balances, and account creation dates.  
   - Queries include checking account ownership, balances, account creation years, and detecting conditions such as multiple accounts or largest balances.  

2. **Bank Calculations (Q2)**  
   - Extends the banking KB with **rules** for calculating:  
     - Subtotals (balance + deposits – withdrawals).  
     - Accrued interest (when balance ≥ threshold).  
     - Penalties (for overdrafts).  
     - End-of-month balances across multiple banks.  

3. **RoboCup Soccer Simulation (Q3)**  
   - Models a simplified robot soccer match.  
   - Rules for `canPass/3` (can a robot pass in ≤M moves) and `canScore/2` (can a robot score in ≤M kicks).  
   - Queries test direct and indirect passing, scoring in one or more steps, and multi-robot collaboration.  

---

## Knowledge Bases

- **Bank KB (Q1)**: facts about people, accounts, balances, and account creation times.  
- **Bank Calc KB (Q2)**: extended with deposits, withdrawals, interest rules, and penalties.  
- **RoboCup KB (Q3)**: facts about robots, ball possession, and path clearance between players and the net.  

---

## Queries

Each `.pl` file contains example queries such as:

% Q1 examples
?- lives(ada_lovelace, san_francisco).
?- hasAccount(alan_turing, cibc, Balance).
?- created(Name, bmo, Month, Year).

% Q2 examples
?- subtotal(john, cibc, Subtotal).
?- accruedInterest(alice, bmo, Interest).
?- endOfMonthBalance(alice, TotalBalance).

% Q3 examples
?- canPass(r3, r2, 1).
?- canScore(r1, 2).
?- canPass(r5, r6, 2).


---

## Results

Sample outputs from running the queries:

- **Bank KB**  
  - Alan Turing has \$7500 in CIBC.  
  - Alice Wonderland has accounts at BMO, Scotiabank, and RBC.  
  - Margaret Hamilton has an account at Wells Fargo but does not live in New York.  

- **Bank Calculations**  
  - John’s subtotal at CIBC = 1400.  
  - Alice’s total end-of-month balance across banks = 3287.525.  
  - Penalty rules correctly applied only for overdrafts.  

- **RoboCup**  
  - r3 can score directly in 1 kick.  
  - r1 can score in 2 kicks (via pass from r3).  
  - r5 can pass to r6 in 1 or 2 moves depending on the path.  

---

## Technologies Used

- **Language**  
  - Prolog (tested with SWI-Prolog)  

- **Tools**  
  - Knowledge Base representation (`facts`)  
  - Rule-based reasoning (`predicates`)  
  - Query execution (`?-`)  

---

## Usage

- **Step 1**: Install [SWI-Prolog](https://www.swi-prolog.org/).  

- **Step 2**: Clone this repository:
  ```bash
  git clone https://github.com/<your-username>/prolog-ai-knowledge-bases.git
