# Form Layout

While building templates, it is usually beneficial to improve them not only technically, but also visually. To improve the user experience of a Witboost user that needs to create a component, we can arrange the fields in a template using different layouts. Witboost support grouping common fields, creating horizontal layouts, and tables.

All examples shown here are taken from the accompanying [`layouts.yaml`](layouts.yaml) template file, which you can see live by following the steps explained [here](../README.md#usage).

## Object layout

As already explained in the [Basic Fields](../BasicFields/basic_fields.md#object-fields) example, we can group fields by creating nested objects in the template steps. This allows us to set a title and a description.

```yaml
numberFields:
  title: Number fields
  type: object
  description: Number fields are a way to enforce an input to accept only integer values 
  required:
    - numberField
  properties:
    numberField:
      title: Integer field
      type: number
    constrainedNumberField:
      title: Number field with constraint 0 <= x <= 10
      type: number
      minimum: 0
      maximum: 10
```

![object_field.png](../BasicFields/img/object_field.png)

If you don't need the title nor description shown on the form you can hide it by setting `ui:options.displayTitle` to false, like so:

```yaml
noTitleGroup:
  type: object
  ui:options:
    displayTitle: false
  properties:
    name:
      title: Field in non-title object
      type: string
```

![no_title_object.png](img/no_title_object.png)

### Horizontal Layout

If you want to display different fields inside an object horizontally instead of vertically, you can change the orientation of the object by adding the field `ui:ObjectFieldTemplate: HorizontalTemplate`. By default, it will set two fields per row horizontally and overflowing to the next row:

```yaml
horizontalLayout:
  title: Horizontal layout
  type: object
  ui:ObjectFieldTemplate: HorizontalTemplate
  properties:
    fieldOne:
      title: Field 1
      type: string
    fieldTwo:
      title: Field 2
      type: string
      enum:
        - Option 1
        - Option 2
    fieldThree:
      title: Field 3
      type: boolean
```

![base_horizontal.png](img/base_horizontal.png)

You can configure the maximum elements per row and the minimum width of each field if you need so.

```yaml
horizontalLayoutOptionsMinElementWidth:
  title: Horizontal layout - 8 shorter width elements
  type: object
  ui:ObjectFieldTemplate: HorizontalTemplate
  ui:options:
    elementsPerRow: 8
    # minElementWidth: 150 -- See image comparison
  properties:
    fieldA:
      title: Field A
      type: string
    fieldB:
      title: Field B
      type: boolean
    fieldC:
      title: Field C
      type: string
    fieldD:
      title: Field D
      type: string
      format: date
    fieldE:
      title: Field E
      type: integer
    fieldF:
      title: Field in non-title object
      type: string
      default: Disabled
      ui:disabled: true
    fieldG:
      title: Field in non-title object
      type: string
      ui:style:
        marginTop: 20px
        background: "#111"
        color: "#0f0"
        font-family: Consolas
```

![modified_horizontal.png](img/modified_horizontal.png)

## Table Layout

You can create tables on your templates by creating an array on objects and setting the `ui:ArrayFieldTemplate: ArrayTableTemplate` property on the array field, and setting `ui:ObjectFieldTemplate: TableRowTemplate` on the child field. Witboost will create a table where each field of the inner object will be rendered as a column, offering the possibility to add, remove and reorder rows.

```yaml
tableExample:
  title: Table Example
  type: array
  ui:ArrayFieldTemplate: ArrayTableTemplate
  ui:options:
    maxDescriptionRows: 2
  default: []
  items:
    type: object
    ui:ObjectFieldTemplate: TableRowTemplate
    required:
      - name
      - dataType
    properties:
      name:
        title: Name
        type: string
      surname:
        title: Surname
        type: string
      salary:
        title: Salary
        type: number
      department:
        title: Department
        type: string
        enum:
          - Finance
          - Marketing
          - IT
          - Sales
      country:
        type: string
        title: Country

```

![table_layout.png](img/table_layout.png)

Check out how we use this layout to define [Table Schema layouts](../TableSchemaLayout/table_schema_layout.md) for specifying the shape and metadata of a table storing data.