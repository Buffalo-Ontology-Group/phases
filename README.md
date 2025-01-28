# Promoting Health Aging through Semantic Enrichment of Solitude Research (PHASES)

## Motivation
Research on _solitude_ often highlights the risks of spending time alone with a focus on negative outcomes, such as mortality and depression. When positive outcomes are associated with solitude, such as increased calmness and lower rates of depression, they are often found most strongly among midlife and older adults. Research on gerotranscendence, which focuses on a sense of psychological connectedness beyond oneself in aging, emphasizes healthy aging and positive outcomes such as enhanced psychological well-being. These areas of research have clear overlap in the context of midlife and older adulthood, but there is at present a gap between the respective literatures. This is partially because even within each field, constructs related to solitude or gerotranscendence are described ambiguously, making it challenging to discern when researchers are in fact using the same construct across studies. Additionally, explaining overlap among constructs in these literatures is non-trivial, requiring evaluation of a range of factors from personal choices to health-related factors to external circumstances. Yet by integrating these areas of study, we will deepen our understanding of the role of solitude in promoting healthy aging and inspire innovative research directions.

## Goals
Our project aims to bridge the gap between these literatures and thus spur novel research into healthy aging. In pursuit of that aim, we will develop the *Solitude Ontology* and the *Gerotranscendence Ontology*, each extending from the upper-level [Behavior Change Intervention Ontology](https://www.bciontology.org/). It is of course not enough to simply create ontologies representing core content in these literatures. To make this knowledge useful to stakeholders, we will create a web portal to provide automated literature recommendations and an sinterface for posing natural language questions about articles in and across these respective literatures. We intend this platform to serve as a hub for researchers, educators, and other professionals to explore and delve into these interconnected concepts, in the interest of identifying, developing, and refining interventions for promoting healthy aging. It is of course not enough to simply create ontologies and an interface to access them. We will, accordingly, pursue an extensive dissemination campaign, involving conference and workshop presentations, consensus-building exercises with other subject-matter experts, peer-reviewed publication, as well as graduate and undergraduate training in the uses of our ontologies and the portal.

## Our Team
- [John Beverley](https://johnbeverley.com/) (PI)
- [Bill Duncan](https://www.linkedin.com/in/biduncan/) (PI)
- [Julie Bowker](https://arts-sciences.buffalo.edu/psychology/faculty/faculty-directory/bowker.html)
- [Hollen Reischer](https://arts-sciences.buffalo.edu/psychology/faculty/faculty-directory/reischer.html)
- [Yongqun "Oliver" He](https://hegroup.org/aboutUs/Oliver.html)
- [Jie Zheng](https://scholar.google.com/citations?user=LY69DAsAAAAJ)
- [Sam Smith](https://observablehq.com/@smithgit)

## Contributing to the Promoting Health Aging through Semantic Enrichment of Solitude Research (PHASES) Ontology

### Robot and Protégé
The PHASES Ontology products and subsets are built using [ROBOT](https://robot.obolibrary.org/) Thus, you will need to have [ROBOT](https://robot.obolibrary.org/) on your system.

Often, you will need to view the ontology products. For this, it is best to use the [Protégé ontology editor](https://protege.stanford.edu/) (see [Configuring Protégé for PHASES Contributions](#configuring-protégé-for-phases-contributions).

### Editor's version
The top-level ontology products and subsets are built using a release process ( see [Updating Ontology Products and Subsets](#updating-ontology-products-and-subsets). Changes made directly to the ontology, such as editing descriptions and managing imports, are made to the editors of this ontology: [src/ontology/phases-edit.owl](https://github.com/Buffalo-Ontology-Group/phases/blob/main/src/ontology/phases-edit.owl).

### Tracking Changes to the PHASES Ontology

To track changes made to the PHASES Ontology, it is best maintained by following these steps:

1. Submit an [issue](https://github.com/Buffalo-Ontology-Group/phases/issues) detailing the problem.
2. Create a branch to address this issue that uses the same number as the issue tracker. For example, if the issue is `#50` in the issue tracker, name the branch `issue-50`. This 
   allows other developers to easily know which branch needs to be checked out to contribute.
3. Create a pull request that fixes the issue. If possible, create a draft (or WIP) branch early in the process.
4. Merge pull request once all the necessary changes have been made. If needed, tag other developers to review the pull request.
5. Delete the issue branch (e.g., branch `issue-50`).

### Updating Ontology Products and Subsets

From time to time, the [imports](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology/imports) used by the PHASES Ontology will need to be updated and new products (i.e., ontology products and subsets) released. The general process for updating the products is as follows:

1. Create an issue, branch, and pull request using the steps outlined in [Tracking Changes to the PHASES Ontology](#tracking-changes-to-the-phases-ontology) section.
2. Navigate to the [src/ontology](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology) directory.
3. Execute `make clean`. This removes all imports, ontologies, and subsets from the [src/ontology](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology) 
   directory. Note, the top-level ontology products and subsets still exist; only the 
   files in the [src/ontology](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology) directory were removed.
4. Execute `make all`. This will create new ontology products and subsets in the [src/ontology](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology) directory.
5. Review the new ontology products and subsets.
6. Once you are satisfied with the new ontology products and subsets, execute `make release`. This will copy the new products to the top-level directory.
7. Finally, push your changes to the repository, make a pull request, and merge.

### Configuring Protégé for PHASES Contributions

**Rationale** 
When a new entity is created using Protégé the entities are created using the default settings of Protégé. For example, using the default settings when a new entity called 'test' is created the IRI for the entity may look like this.

`http://www.semanticweb.org/user/ontologies/2025/6/untitled-ontology-43#test`

Ideally, we want the new entity created in the PHASES ontology to look similar to the IRI below:

`http://purl.obolibrary.org/obo/PHASES_0000024`

**Prerequisites**

**_Protégé_**
If you do not have installed Protégé ontology editor on your machine, please download and install it from this [link](https://protege.stanford.edu/).

**_Create ORCID identifier_**
If you do not have an ORCID ID please create one by [registering here](https://orcid.org/) ORCID ID is a free-of-charge identifier for researchers.

**Update Preferences**

**_Where can I find Protégé preferences?_**
  - Open Protégé.
  - Go to **File > Preferences**.
    
**_Update user details in Protégé_**

  - Go to Protégé **Preferences**.
  - Click on the **User details** tab.
  - Enable **Use supplied user name**.
  - Enter your full name in the field indicated.
  - Enable **Use Git user name when available**.
  - Enter your ORCID ID in the field for **ORCID**.
  - Click **OK** to save.

**_Update configuration for new entities_**

- Go to Protégé **Preferences**.
- Click the **New entities** tab.
- Update **Entity IRI**.
    For **Start with**: enable 'Specified IRI' and enter the following IRI in the field:
        `http://purl.obolibrary.org/obo`
    For **Followed by**: enable the forward slash option (/).
    For **End with**: enable 'Auto-generated ID'.
- Update **Entity Label**.
    Enable **Same as label renderer**.
- Update **Auto-generated ID**.
    Enable **Numeric (Iterative)**.
    For **Prefix**: enter **PHASES_** in the field provided.
    For **Start**: enter the lower value integer of the ID range if one has been assigned to you. For example 2,000. Most regular contributors are assigned an ID range.
    For **End**: enter the upper-value integer of the ID range if one has been assigned to you. For example 2,999.
    Enable **Remember last ID between Protégé sessions**.
- Click **OK** to save.

**_Update configuration for new entities metadata_**

- Go to Protégé **Preferences**.
- Click the **New entities metadata tab**.
- Enable **Annotate new entities with creator (user)**.
- For **Creator property** enter the following IRI the field:
    `http://purl.org/dc/terms/contributor`
- For **Creator value** enable **Use ORCID**.
- Enable **Annotate new entities with creation date/time**.
- For **Date property** enter the following IRI the field:
    `http://purl.org/dc/terms/created`
- For **Date property** enable **ISO-8601**.
- Click **OK** to save.
