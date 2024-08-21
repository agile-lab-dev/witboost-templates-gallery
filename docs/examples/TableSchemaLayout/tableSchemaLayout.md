---
sidebar_position: 4
---
# OpenMetadata Table Schema Layout

In most occasions, data is organized on tabular form, and many components, like Storages and Output Ports on Data Mesh, create tables or views to give a place for ingestion workloads to read and write data and for Output Ports to expose information to users or other systems. Because of this, the schema of the table is often present on the metadata of said components, and it is decided by the user when creating or editing it. Witboost recommends using the OpenMetadata Table specification whenever possible, including it itself on the Data Contract schema on its [Data Product specification](https://github.com/agile-lab-dev/Data-Product-Specification).

Here we provide an example yaml [`table_schema_layout.yaml`](table_schema_layout.yaml) and its accompanying [`catalog-info.yaml`](skeleton/catalog-info.yaml) template for a complete table layout for allowing the user to define a table schema. It provides a subset of the OpenMetadata data types, but it can be easily extensible to support others or to drop support from some. Specifically, it provides:

- Support for column name, description, data type, constraints, and tags
- Support for `[TINYINT, SMALLINT, INT, BIGINT, DOUBLE, DECIMAL, TIMESTAMP, DATE, STRING, TEXT, CHAR, VARCHAR, BOOLEAN, ARRAY]` data types
- For `[TEXT, VARCHAR, CHAR]` data types, data length is asked to the user
- For `DECIMAL` data type, precision and scale are asked to the user
- For `ARRAY` data type, you can define the array data type and its details

![om_table_schema_layout](img/om_table_schema_layout.png)

This field generates a `schemaDefinition` object with an array named `schemaColumns` containing the specification for each column. This nesting provides the possibility to use other pickers like the **DescriptorPicker** or the **EntitySelectionPicker** to perform operations on the table schema. See [Dynamic Select](../DynamicSelect/dynamicSelect.md) for more information. 

This table layout is embedded on the [Base Storage](../BaseComponents/BaseStorage/baseStorage.md) and [Base Output Port](../BaseComponents/BaseOutputPort/FullExperience/fullExperience.md) examples.