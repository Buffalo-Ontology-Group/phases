#!/usr/bin/env python3

from rdflib import Graph

# -----------------------------
# Load graph
# -----------------------------

g = Graph()

# Change this to your actual TTL/NT file
INPUT_FILE = "documentation/design_patterns/narrative_assessment/narrative.ttl"
g.parse(INPUT_FILE, format="turtle")

print(f"Loaded {len(g)} triples\n")

# -----------------------------
# Prefixes
# -----------------------------

PREFIXES = """
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX d3f: <https://d3fend.mitre.org/ontologies/d3fend.owl#>
"""

# -----------------------------
# Competency Queries
# -----------------------------

PREFIXES = """
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX cco:  <http://www.ontologyrepository.com/CommonCoreOntologies/>
PREFIX obo:  <http://purl.obolibrary.org/obo/>
"""

QUERIES = {

    "CQ1_agent_creating_narrative": PREFIXES + """
    SELECT DISTINCT ?agent ?agentLabel
    WHERE {
    ?agent a obo:MF_0000016 ;
            obo:BFO_0000056 ?construction .

    ?construction a obo:BFO_0000015 ;
                    obo:RO_0002234 ?narrative .

    ?narrative a obo:IAO_0000030 .

    OPTIONAL { ?agent rdfs:label ?agentLabel }
    }
    """,

    "CQ2_what_theme": PREFIXES + """
    SELECT DISTINCT ?agent ?theme ?themeLabel
    WHERE {
    ?agent a obo:MF_0000016 .

    ?narrative a obo:IAO_0000030 .

    ?theme obo:IAO_0000136 ?narrative .

    ?theme a obo:PHASES_0000008 .

    ?narrative obo:IAO_0000136 ?life .

    ?agent obo:BFO_0000185 ?life .

    OPTIONAL { ?theme rdfs:label ?themeLabel }
    }
    """,

    "CQ3_information_content_result": PREFIXES + """
    SELECT DISTINCT ?agent ?structure ?structureLabel
    WHERE {
    ?agent a obo:MF_0000016 ;
            obo:BFO_0000185 ?history .

    ?history a obo:BFO_0000182 .

    ?narrative a obo:IAO_0000030 ;
                obo:IAO_0000136 ?history ;
                obo:BFO_0000178 ?structure .

    OPTIONAL { ?structure rdfs:label ?structureLabel }
    }
    """
}

# -----------------------------
# Run all CQs
# -----------------------------

for name, query in QUERIES.items():
    print("=" * 70)
    print(name)
    print("-" * 70)

    results = g.query(query)

    if len(results) == 0:
        print("No results\n")
        continue

    for row in results:
        for k, v in row.asdict().items():
            print(f"{k}: {v}")
        print()

print("=" * 70)
print("Done.")
