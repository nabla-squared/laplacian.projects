<!-- @head-content@ -->
# laplacian/projects

The core modules for the Laplacian generator.


*Read this in other languages*: [[日本語](README_ja.md)] [[简体中文](README_zh.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
1. [Usage](#Usage)
1. [Index](#Index)


<!-- @toc@ -->

<!-- @main-content@ -->
## Usage

To apply this Model module, add the following entry to your project definition.
```yaml
project:
  models:
  - group: laplacian
    name: projects
    version: 1.0.0
```

You can run the following command to see a list of resources affected by the application of this module and their contents.
```console
$ ./script/generate --dry-run

diff --color -r PROJECT_HOME/.NEXT/somewhere/something.md PROJECT_HOME/somewhere/something.md
1,26c1,10
< content: OLD CONTENT
---
> content: NEW CONTENT
```

If there is no problem, execute the following command to reflect the change.
```console
$ ./script/generate --dry-run

```


## Index


### Source code list


- [model/project.yaml](<./model/project.yaml>)
- [src/project/subprojects/laplacian-arch.architecture-document-template.yaml](<./src/project/subprojects/laplacian-arch.architecture-document-template.yaml>)
- [src/project/subprojects/laplacian-arch.datasource.flyway-migration-template.yaml](<./src/project/subprojects/laplacian-arch.datasource.flyway-migration-template.yaml>)
- [src/project/subprojects/laplacian-arch.datasource.schema-model.yaml](<./src/project/subprojects/laplacian-arch.datasource.schema-model.yaml>)
- [src/project/subprojects/laplacian-arch.datasource.schema-plugin.yaml](<./src/project/subprojects/laplacian-arch.datasource.schema-plugin.yaml>)
- [src/project/subprojects/laplacian-arch.service-api.schema-model.yaml](<./src/project/subprojects/laplacian-arch.service-api.schema-model.yaml>)
- [src/project/subprojects/laplacian-arch.service-api.schema-plugin.yaml](<./src/project/subprojects/laplacian-arch.service-api.schema-plugin.yaml>)
- [src/project/subprojects/laplacian-arch.service-api.springboot2-template.yaml](<./src/project/subprojects/laplacian-arch.service-api.springboot2-template.yaml>)
- [src/project/subprojects/laplacian.common-model-plugin.yaml](<./src/project/subprojects/laplacian.common-model-plugin.yaml>)
- [src/project/subprojects/laplacian.common-model.yaml](<./src/project/subprojects/laplacian.common-model.yaml>)
- [src/project/subprojects/laplacian.domain-model.document-template.yaml](<./src/project/subprojects/laplacian.domain-model.document-template.yaml>)
- [src/project/subprojects/laplacian.metamodel-plugin.yaml](<./src/project/subprojects/laplacian.metamodel-plugin.yaml>)
- [src/project/subprojects/laplacian.metamodel.yaml](<./src/project/subprojects/laplacian.metamodel.yaml>)
- [src/project/subprojects/laplacian.project.base-template.yaml](<./src/project/subprojects/laplacian.project.base-template.yaml>)
- [src/project/subprojects/laplacian.project.document-template.yaml](<./src/project/subprojects/laplacian.project.document-template.yaml>)
- [src/project/subprojects/laplacian.project.project-types.yaml](<./src/project/subprojects/laplacian.project.project-types.yaml>)
- [src/project/subprojects/laplacian.project.schema-model.yaml](<./src/project/subprojects/laplacian.project.schema-model.yaml>)
- [src/project/subprojects/laplacian.project.schema-plugin.yaml](<./src/project/subprojects/laplacian.project.schema-plugin.yaml>)
- [src/project/subprojects/laplacian.schema.plugin-template.yaml](<./src/project/subprojects/laplacian.schema.plugin-template.yaml>)


<!-- @main-content@ -->