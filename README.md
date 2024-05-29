<p align="center">
    <a href="https://www.witboost.com">
        <img src="img/witboost_logo.svg" alt="witboost" width=600 >
    </a>
</p>

Designed by [Agile Lab](https://www.agilelab.it/), Witboost is a versatile platform that addresses a wide range of sophisticated data engineering challenges. It enables businesses to discover, enhance, and productize their data, fostering the creation of automated data platforms that adhere to the highest standards of data governance. Want to know more about Witboost? Check it out [here](https://www.witboost.com) or [contact us!](https://witboost.com/contact-us).

# Witboost Template Gallery

- [Overview](#overview)
- [Guidelines](docs/guidelines.md)
- [Templating Solutions](docs/templating_solutions.md)
- [Examples](docs/examples/README.md)

## Overview

This repository aims to provide a comprehensive guide to building templates for Witboost. Templates are a core part of the user experience when using Witboost, as such for the Platform Team it is crucial to develop easy-to-use, intuitive, reusable templates.

The repository includes guidelines on how to design the wizard and other parts of a template, best practices to follow when working on them, and examples of reusable snippets that can be incorporated in your templates.

### What's a Template?

A Template is a tool that helps create components inside Witboost. Templates help establish a standard across the organization. This standard leads to easier understanding, management and maintenance of components. Templates provide a predefined structure so that developers don't have to start from scratch each time, which leads to faster development and allows them to focus on other aspects, such as testing and business logic.

A template is composed of two main parts:
- the wizard
- the skeleton

The wizard is what the user is presented with when they choose a template to define a new component in Witboost. It guides the user into configuring the new component and providing metadata and other information about it.

![Template Wizard](docs/img/wizard.png)

The skeleton contains a templated version of what will become the contents of the repository of the new template. It can be as simple as just the metadata files required by Witboost, or as complex as an entire codebase for complex workloads, with documentation on the component that is being defined.

```
template.yaml
mkdocs.yml
docs/
├──── index.md
skeleton/
├──────── README.md
├──────── catalog-info.yaml
├──────── mkdocs.yml
├──────── .gitlab-ci.yaml   <--- CI/CD pipeline which will be executed by Use case templates
├──────── docs/
│         └──── index.md
├──────── environments/
│         ├──────────── dev/
│         │             └─── configurations.yaml
│         ├──────────── prod/
│         │             └──── configurations.yaml
│         └──────────── # any other env config goes here
└──────── # any other skeleton files here
```

If you're looking to develop your first template using the information in this repository, we suggest starting from the [guidelines](docs/guidelines.md).

For more information on templates, also check out the [official documentation](https://docs.witboost.agilelab.it/docs/p1_user/p6_advanced/p6_1_templates/#getting-started).

## License

This project is available under the [Apache License, Version 2.0](https://opensource.org/licenses/Apache-2.0); see [LICENSE](LICENSE) for full details.

## About us

<p align="center">
    <a href="https://www.agilelab.it">
        <img src="img/agilelab_logo.svg" alt="Agile Lab" width=600>
    </a>
</p>

Agile Lab creates value for its Clients in data-intensive environments through customizable solutions to establish performance driven processes, sustainable architectures, and automated platforms driven by data governance best practices.

Since 2014 we have implemented 100+ successful Elite Data Engineering initiatives and used that experience to create Witboost: a technology-agnostic, modular platform, that empowers modern enterprises to discover, elevate and productize their data both in traditional environments and on fully compliant Data mesh architectures.

[Contact us](https://www.agilelab.it/contacts) or follow us on:
- [LinkedIn](https://www.linkedin.com/company/agile-lab/)
- [Instagram](https://www.instagram.com/agilelab_official/)
- [YouTube](https://www.youtube.com/channel/UCTWdhr7_4JmZIpZFhMdLzAA)
- [Twitter](https://twitter.com/agile__lab)
