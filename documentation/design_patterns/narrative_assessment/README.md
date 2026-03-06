# Pattern Name

Narrative themes

This pattern was authored by Rachel Mavrovich, Noor M. Al-Kahouli, Giacomo De Colle.

## Description
A simple DP showing how an agent creates a narrative of their life following a certain theme.

## Intent
The intent of this pattern is to represent how an agent creates 

## Competency Questions
- What agent is creating a narrative?
- What theme(s) are identifiable in the dispositions of the narrative agent?
- What is the structure of the narrative of the agent?


## Directory Structure
- `narrative assessment/narrative.md` represents the pattern graphically
- `narrative assessment/README.md` describes the pattern
- `narrative assessment/queries.py` contains the queries which can be run over the test graph to check that the DP answers the competency questions
- `narrative assessment/narrative.ttl` is the example graph containing to run queries

To run the rdflib script, make sure you have rdflib installed with something like

```bash
python3 -m venv .venv

source .venv/bin/activate

pip install rdflib
```