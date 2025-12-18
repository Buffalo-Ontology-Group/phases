# Ontology source

This directory contains the files for editing the PHASES ontology.  

## Editing PHASES

To make changes to the PHASES, edit `phases-edit.owl`. **DO NOT** edit the `phases.owl` file directly. The `phases.owl` file is produced during the release process.

## Releasing PHASES

### Steps for Creating a Release

1. Create a New Branch for the Release

   Use the current date or a descriptive tag as the branch name:

     ```bash
      git checkout -b release-YYYY-MM-DD
      ```
2. Run the Release Preparation Command

   Execute the following from the src/ontology:

      ```bash
      make prepare-release
      ```

   This command:
      - Runs validation and quality checks.
      - Generates the release products, including:
      - `phases.owl`
      - `phases.obo`
      - `phases.json`
      - `phases-base.owl`, etc.
      - Updates the version IRIs and metadata.

3. Review and Commit the Generated Files

   Run a Hermit reasoner (if possible) locally to check-in on phases.owl

   Inspect the release files. Changes may be minimal (typically just version updates if no content was added).

   Then commit the release:

   ```copy these files to the root
   git commit -m "Prepare release for YYYY-MM-DD"
   ```

4. Push the Release Branch

   ```bash
   git push origin release-YYYY-MM-DD
   ```

5. Create a Pull Request

   - Go to GitHub and open a pull request from the release branch into `main`.
   - Use a title like:  `Release: YYYY-MM-DD`.
   - Wait for automated checks (if configured).
   - Merge the PR once checks pass.

6. Draft the GitHub Release

   After merging to `main`:

   - Go to the **Releases** tab in the GitHub UI.
   - Click **Draft a new release**
   - Set the **tag** name: ```text vYYYY-MM-DD```
   - Set the **release title**: ```text Release: YYYY-MM-DD```
   - Add **release notes**.
   - Mark it as the **latest release**.
   - Click **Publish Release**.


### Notes on Release Artifacts

The `make prepare-release` command generates several formats:

- `.obo`, `.owl`, `.json`: Standard ontology formats.
- `*-base` versions: Contain only locally defined classes (no imports).
- These are the canonical files used by portals like OLS or OntoBee.

## Contributing to the Promoting Health Aging through Semantic Enrichment of Solitude Research (PHASES) Ontology

### Robot and Protégé
The PHASES Ontology products and subsets are built using [ROBOT](https://robot.obolibrary.org/) Thus, you will need to have [ROBOT](https://robot.obolibrary.org/) on your system.

Often, you will need to view the ontology products. For this, it is best to use the [Protégé ontology editor](https://protege.stanford.edu/) (see [Configuring Protégé for PHASES Contributions](#configuring-protégé-for-phases-contributions).

### Editor's version
The top-level ontology products and subsets are built using a release process ( see [Updating Ontology Products and Subsets](#updating-ontology-products-and-subsets). Changes made directly to the ontology, such as editing descriptions and managing imports, are made to the editors of this ontology: [src/ontology/phases-edit.owl](https://github.com/Buffalo-Ontology-Group/phases/blob/main/src/ontology/phases-edit.owl).

### Tracking Changes to the PHASES Ontology

To track changes made to the PHASES Ontology, it is best maintained by following these steps:

1. Submit an [GitHub issues](https://github.com/Buffalo-Ontology-Group/phases/issues) detailing the problem.
2. Create a branch to address this issue that uses the same number as the issue tracker. For example, if the issue is `#50` in the issue tracker, name the branch `issue-50`. This 
   allows other developers to easily know which branch needs to be checked out to contribute.
3. Create a pull request that fixes the issue. If possible, create a draft (or WIP) branch early in the process.
4. Merge pull request once all the necessary changes have been made. If needed, tag other developers to review the pull request.
5. Delete the issue branch (e.g., branch `issue-50`).

### Ontology Subsets

The PHASES ontology generates subsets for the domains of ***solitude*** and ***gerotranscendence***, emphasizing their relevance to healthy aging. These subsets include relevant terms extracted from the PHASES ontology, their hierarchical ancestors, and additional annotations to make them useful for research and application.

***Gerotranscendence Ontology (Gero)***

- Developed as a subset of PHASES.
- Focuses on constructs related to ***gerotranscendence***, emphasizing a sense of psychological connectedness beyond oneself in aging.
- Contains ***terms, hierarchical relationships, and annotations*** relevant to the study of gerotranscendence.
- Issues and term requests can be submitted at [issue](https://github.com/Buffalo-Ontology-Group/phases/issues).
- ***License***: CC0 1.0
- ***Version***: 2025-12-05 (current subset build date)

***Solitude Ontology (Solo)***

- Developed as a subset of PHASES.
- Focuses on constructs related to solitude, including its dimensions, experiences, and outcomes.
- Contains terms, hierarchical relationships, and annotations relevant to defining and classifying solitude.
- Issues and term requests can be submitted at [issue](https://github.com/Buffalo-Ontology-Group/phases/issues).
- ***License***: CC0 1.0
- ***Version***: 2025-12-05 (current subset build date)

### Ontology Imports

Currently, the PHASES ontology uses the following import modules and term lists:
- BCIO (Behaviour Change Intervention Ontology): `bcio_import.owl`, `bcio_terms.txt`
- MF (Mental Functioning / Mental Functioning Ontology): `mf_import.owl`, `mf_terms.txt`
- OMO (Ontology for Mediation and Organization): `omo_import.owl`
- RO (Relations Ontology): `ro_import.owl`, `ro_terms.txt`
- The *_terms.txt files specify the subset of external terms to be imported, while the corresponding *_import.owl files are generated artifacts used during the build and release process.

### Updating Ontology Products and Subsets

From time to time, the [imports](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology/imports) used by the PHASES Ontology will need to be updated and new products (i.e., ontology products and subsets) released. The general process for updating the products is as follows:

1. Create an issue, branch, and pull request using the steps outlined in [Tracking Changes to the PHASES Ontology](#tracking-changes-to-the-phases-ontology) section.
2. Navigate to the [src/ontology](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology) directory.
3. Execute `make clean`. This removes all locally generated ontologies, and subsets from the [src/ontology](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology) directory. Note, the top-level ontology products and subsets still exist; only the files in the [src/ontology](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology) directory were removed.
4. Execute `make all`. This will create new ontology products and subsets in the [src/ontology](https://github.com/Buffalo-Ontology-Group/phases/tree/main/src/ontology) directory.
5. Review the new ontology products and subsets.
6. Once you are satisfied with the new ontology products and subsets, execute `make release`. This will copy the new products to the top-level directory.
7. Finally, push your changes to the repository, make a pull request, and merge.

### Workflow for Adding or Updating Ontology Imports

To add new external terms or update existing imports used by PHASES, follow this workflow:

1. **Create or Update the Terms File**

   - Add the IRIs of the required external terms to the appropriate `*_terms.txt` file in `src/ontology/imports/`
   - Each term IRI must be listed on its own line.
   - These files define the exact subset of external ontology terms to be imported.

2. **Update `phases-imports.Makefile`**

   - Edit `src/ontology/phases-imports.Makefile`.
   - Register the new or updated import by:
   - Adding the corresponding `*_terms.txt` file.
   - Defining the target for generating the associated `*_import.owl` file.
   - This ensures the import module is generated automatically during `make all` and `make release`.

3. **Register the Import in `catalog-v001.xml`**

   - Edit `src/ontology/catalog-v001.xml`.
   - Add a new `<uri>` entry mapping the ontology IRI to the local import file.
   - This allows Protégé and ROBOT to correctly resolve imported ontologies during editing, reasoning, and release builds.

4. **Regenerate Imports and Ontology Products**

   From the `src/ontology` directory, run:
   ```bash
   make clean
   make all
   ```
   
5. **Review and Release**

   - Verify the generated `*_import.owl` files and downstream ontology products.
   - Once validated, proceed with the standard release workflow described in the **Updating Ontology Products and Subsets** section.

### Configuring Protégé for PHASES Contributions

**Rationale**

When a new entity is created using Protégé the entities are created using the default settings of Protégé. For example, using the default settings when a new entity called 'test' is created the IRI for the entity may look like this.

`http://www.semanticweb.org/user/ontologies/2025/6/untitled-ontology-43#test`

Ideally, we want the new entity created in the PHASES ontology to look similar to the IRI below based on OBO Foundary principles:

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
  - The **user name should match with the user name given in the Id range**. 
  - Enter your ORCID ID in the field for **ORCID**.
  - Click **OK** to save.


![image](https://github.com/user-attachments/assets/6ec3a0d1-4ec1-464b-935e-4bfd69d35939)


**_Update configuration for new entities_**

- Go to Protégé **Preferences**.
- Click the **New entities** tab.
- Update **Entity IRI**.
  
- For **Start with**: enable 'Specified IRI' and enter the following IRI in the field:
     
   -`http://purl.obolibrary.org/obo`
   - For **Followed by**: enable the forward slash option (/).
   - For **End with**: enable 'Auto-generated ID'.
   - Update **Entity Label**.
   - Enable **Same as label renderer**.
   - Update **Auto-generated ID**.
   - Enable **Numeric (Iterative)**.
   - For **Prefix**: enter **PHASES_** in the field provided.
   - For **Start**: enter the lower value integer of the ID range if one has been assigned to you. For example 2,000. Most regular contributors are        assigned an ID range.
   - For **End**: enter the upper-value integer of the ID range if one has been assigned to you. For example 2,999.
   - Enable **Remember last ID between Protégé sessions**.
   - Click **OK** to save.


![image](https://github.com/user-attachments/assets/b8cbe708-7127-4450-95c3-915b883f754b)


**_Update configuration for new entities metadata_**

- Go to Protégé **Preferences**.
- Click the **New entities metadata** tab.
- Enable **Annotate new entities with creator (user)**.
- For **Creator property** enter the following IRI the field:
    `http://purl.org/dc/terms/contributor`
- For **Creator value** enable **Use ORCID**.
- Enable **Annotate new entities with creation date/time**.
- For **Date property** enter the following IRI the field:
    `http://purl.org/dc/terms/created`
- For **Date property** enable **ISO-8601**.
- lick **OK** to save.
  
![image](https://github.com/user-attachments/assets/c24c6360-c471-4634-b9d9-42ea883ef050)
