# Base Workload

Workloads are one of the main components of the Data Mesh data platform taxonomy. They allow the definition and scheduling of all ETL processes, DAG workflows, etc. needed for the Data Product to work.

This example shows a base template for a Workload, that you can clone and extend based on your technology and environment requirements.

You can see real life examples of this type of Workload templates on our [Witboost Starter Kit](https://github.com/agile-lab-dev/witboost-starter-kit):

- [Airbyte File to Snowflake Workload](https://github.com/agile-lab-dev/witboost-airbyte-workload-template)
- [CDP CDE Spark Workload](https://github.com/agile-lab-dev/witboost-cdp-cde-spark-workload-template)
- [DBT Workload](https://github.com/agile-lab-dev/witboost-dbt-workload-template)
- [MWAA Workload](https://github.com/agile-lab-dev/witboost-mwaa-workload-template)

## Usage

You can use this folder as the base for a template repository and start developing your own Workload template, as it has the expected structure. Just ensure to rename the example yaml to `template.yaml` and the edit template example yaml to `edit-template.yaml` and to modify all the necessary fields and identifiers like:

- Set the template metadata information, description and default values, the `useCaseTemplateId` and the `infrastructureTemplateId` in both `template.yaml` and `edit-template.yaml` files according to the component you're creating.
- Replace all the placeholders present in the `template.yaml` and the `skeleton/catalog-info.yaml` files according to the component and environment you're creating. Placeholders are written between angled brackets (e.g. `<PLACEHOLDER>`).
- Add the appropriate README and documentation for both your template and the generated skeleton
- Modifying the repository destination URL, check [Repository location](#repository-location) for more details.

## Template sections

### Component metadata

You might already be familiar with this section, as it is relatively stable across different kinds of components. To learn more about these fields, check the [Component Metadata](../ComponentMetadata/component_metadata.md) example.

### Workload job and scheduling details

This section provides an example on which kind of information a Workload might need in order to work. It focuses on the minimal set of necessary values or default values that the Workload requires at creation time.

Customize this section and further sections based on the requirements for the specific technology you're using. Follow the best practices guidelines to understand which fields you should or should not add. 

### Repository location

See the [Output Port Streamlined Experience](../BaseOutputPort/StreamlinedExperience/base_streamlined_experience.md#repository-location) for more information on how we calculate repository URLs to avoid asking the user this information.