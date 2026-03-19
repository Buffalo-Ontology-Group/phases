```mermaid
flowchart LR

%% =========================
%% PREFIXES (CURIEs)
%% =========================
%% bfo: http://purl.obolibrary.org/obo/BFO_
%% ro:  http://purl.obolibrary.org/obo/RO_
%% iao: http://purl.obolibrary.org/obo/IAO_
%% obi: http://purl.obolibrary.org/obo/OBI_
%% omrse: http://purl.obolibrary.org/obo/OMRSE_
%% mf: http://purl.obolibrary.org/obo/MF_
%% phases: http://purl.obolibrary.org/obo/PHASES_

%% =========================
%% INDIVIDUALS (ABOX ONLY)
%% =========================

subgraph _
direction LR

subgraph __
direction TB
Narrative_Agent_1["Subject 1\nHuman Being (mf:0000016)"]
Agent_Life_1["Agent Life 1\nHistory (bfo:0000182)"]
Self1["Self-appraisal Quality\nSelf-appraisal representational pattern quality (phases:0000006)"]
Role2["participant under investigation role (obi:0000097)"]
end

subgraph ___
direction TB
Narrative_Construction["Narrative construction Process\nProcess (bfo:0000015)"]
ICE_instance["Narrative ICE\nInformation Content Entity (iao:0000030)"]
end

subgraph ____
direction TB
Psychologist["Psychologist\nHuman Being (mf:0000016)"]
Analysis["Analysis Procedure Process\nProcess (bfo:0000015)"]
Narrative_Theme["Narrative Theme Assessment\nConclusion based on data ICE (obi:0001909)"]
Narrative_Structure_Assessment["Narrative Structure Assessment\nConclusion based on data ICE (obi:0001909)"]
Role1["Healthcare Provider Role\nhealth care provider role (omrse:00000012)"]
end

end

%% =========================
%% RELATIONS (CURIEs)
%% =========================

Narrative_Agent_1 -->|"hasHistory (bfo:0000185)"| Agent_Life_1
Narrative_Agent_1 -->|"hasRole (ro:0000087)"| Role2

Narrative_Construction -->|"hasOutput (ro:0002234)"| ICE_instance
ICE_instance -->|"isAbout (iao:0000136)"| Agent_Life_1

Narrative_Construction -->|"realizes (bfo:0000055)"| Role2
Analysis -->|"realizes (bfo:0000055)"| Role1
Psychologist -->|"hasRole (ro:0000087)"| Role1

Analysis -->|"hasOutput (ro:0002234)"| Narrative_Theme
Analysis -->|"hasOutput (ro:0002234)"| Narrative_Structure_Assessment

Narrative_Theme -->|"isAbout (iao:0000136)"| ICE_instance
Narrative_Structure_Assessment -->|"isAbout (iao:0000136)"| ICE_instance

Self1 -->|"concretizes (ro:0000059)"| ICE_instance
Self1 -->|"specificallyDependsOn (bfo:0000195)"| Narrative_Agent_1

%% =========================
%% STYLING
%% =========================

classDef individual fill:#dbc9ef

class Narrative_Agent_1,Agent_Life_1,Self1,Role2,Narrative_Construction,ICE_instance,Psychologist,Analysis,Narrative_Theme,Narrative_Structure_Assessment,Role1 individual
```