---
sidebar_position: 7
---
# Transforming entities

When creating templates, you might end up storing more than simple primitive values (strings, numbers, etc.) on the template fields. Objects and arrays of objects can be specially useful if you're creating complex structures like table schemas or handling catalog entities like other components, users and groups, etc. In many occasions the object in their original form is not what you need, but it rather needs to be mapped to a new schema.

This is especially useful when working with Access Control Request Templates, which don't provide the Nunjucks flexibility component templates have to manipulate objects on the templating step.

[//]: # (TODO give an example of ACR template.yaml here?)

All examples shown here are taken from the accompanying [`transforming_entities.yaml`](transforming_entities.yaml) template file, which you can see live by following the steps explained [here](../README.md#usage).

## EntitySelectionPicker

The **EntitySelectionPicker** allows mapping source objects into a new flat object structure using the `mapTo` property. This is useful if we need a structured object storing one or multiple values of the same source. 

```yaml
sourceValue:
  title: Source entity
  type: string
  description: "EntityPicker choosing a kind: system from catalog"
  ui:field: EntityPicker
  ui:options:
    allowedKinds:
      - System
targetMapToValue:
  title: Target value + object mapping
  type: object
  ui:field: EntitySelectionPicker
  ui:fieldName: catalogMapping.sourceValue
  ui:options:
    allowArbitraryValues: false
  mapTo:
    systemName: spec.mesh.name
    systemOwner: spec.owner
  ui:displayLabel: systemName
```

The example above transform the source, which in this case is the System entity ID (most pickers store the entity ID [rather than the whole object](../DynamicSelect/dynamicSelect.md#using-the-retrieved-entity)), into an object containing two fields `systemName` and `systemOwner` which will now be accessible from the `targetMapToValue` object.

We can extend this behaviour to the array case, where each item of the source array gets mapped into a new object. Let's suppose you've used an **IdentitiesPicker** to load a set of users and/or groups to the template. However, you need to transform the catalog entity to a new object type that suits your needs to send an access control request. [Retrieve Data](../RetrieveData/retrieveData.md#catalog-source) explains how to hook an **EntitySelectionPicker** to the IdentitiesPicker in order to create an array of strings based on *one* property of the User entity. Now we can extend this behaviour further to create a new object by defining the fields to preserve.

```yaml
identitiesSourceValue:
  title: Source entity
  type: array
  description: "Choose some identities from the catalog"
  ui:field: IdentitiesPicker
  ui:options:
    maxIdentities: 5
    allowedKinds:
      - User
    showOnlyUserMemberGroups: true
multipleTargetValue:
  title: Target values
  type: array
  ui:field: EntitySelectionPicker
  ui:fieldName: identitiesSourceValue
  mapTo:
    email: spec.profile.email
  ui:displayLabel: email
```

The example above converts the list of catalog entities, to a list of objects each one containing a single key-value pair (`email: "..."`) following the configuration set on the `mapTo` property.

## CustomUrlPicker

As explained on [Dynamic Select](../DynamicSelect/dynamicSelect.md#external-source-api), the **CustomUrlPicker** can also perform transformation of the retrieved objects. See that section for more information on how it can be done. 