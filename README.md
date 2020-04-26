---
mainfont: PTS55F.ttf
monofont: Hack-Regular.ttf
mainfontoptions:
- BoldFont=PTS75F.ttf
- ItalicFont=PTS56F.ttf
- BoldItalicFont=PTS76F.ttf
title: "Decision Support Methods - Assignment 2"
author:
- Diogo Cordeiro
- João Varelas
geometry: a4paper
geometry: margin=2cm
output: pdf_document
---

# Introduction

We were given a problem to locate a facility given a set of candidates towns.
The available dataset [1] contains the population of each city and its coordinates
allowing us to calculate the distances between them. The goal is to decide how many
distribution centres along the country to allocate constrained by a certain budget.

# Question 1

Question data:

Name                                                      | Description
----------------------------------------------------------|-------------------------
$$ City $$                                                | set of cities
$$ latitude_{c}, c \in City $$                            | cities' latitudes
$$ longitude_{c}, c \in City $$                           | cities' longitudes
$$ distance_{c_{i}c_{j}}, c_{i},c_{j} \in City $$         | distance between $$ c_{i} $$ and $$ c_{j} $$
$$ population_{c}, c \in City $$                          | cities' population
$$ R $$                                                   | earth radius (km)
$$ yearly_cost $$                                         | yearly cost of opening a Distribution Centre

## Optimization Model

### Data
### Variables
### Formulation
### Solution



# Question 2

## Optimization Model

### Data
### Variables
### Formulation
### Solution

# References

[1] [https://www.dcc.fc.up.pt/~jpp/mad1920/PopulationContPT-2020.csv](https://www.dcc.fc.up.pt/~jpp/mad1920/PopulationContPT-2020.csv)
