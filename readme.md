# Database as Code 

This project contains the resources for my presentation on Wednesday, October 6, 2021 around Database as Code. 

## Requirement 

- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15&WT.mc_id=DOP-MVP-5001937)
- [Azure Data Studio extension : SQL Server DacPac](https://github.com/microsoft/azuredatastudio/wiki/List-of-Extensions)
- [Dotnet Core 5.*](https://dotnet.microsoft.com/download?WT.mc_id=DOP-MVP-5001937)

Is a plus 
- [MSBuild.Sdk.SqlProj .net new template](https://github.com/rr-wfm/MSBuild.Sdk.SqlProj?WT.mc_id=DOP-MVP-5001937#usage)

# As is 

Today, when you want to migrate a database, three choice are available:
- Manual migration (using SQL Server Management Studio)
- Automatic migration (entity framework, etc...)
- Desired State (DacPac, Liquibase, etc...)

The first one is the most common but human error prone. 
The second one is more complex because you need to know the database structure and if the database structure change you need to update the migration scripts.
The last one is the most common and easy to maintain. 

## DacPac

DacPac is a package that contains the database structure and the migration scripts. It based on Xml zipped package. More information about [DacPac](https://docs.microsoft.com/en-us/sql/relational-databases/database-migration/migrate-sql-server-database-using-dacpac?view=sql-server-ver15&WT.mc_id=DOP-MVP-5001937).

## DevOps one step ahead

During this presentation, we discovered how to : 

- Extract the database structure from the database (DacPac file) with Azure Data Studio.
- Create a database from the database structure (DacPac file) with Azure Data Studio.
- Create a new dotnet project based on the open source project [MSBuild.Sdk.SqlProj](https://github.com/rr-wfm/MSBuild.Sdk.SqlProj).
- Create a build to generate the dacpac migration file on Azure DevOps Pipelines or GitHub Actions. (See below to get more information)
- Use Azure DevOps Release to deploy it on Azure SQL Server.

## Project good practices structure 
```
database
├── schema.sql (contains create schema)
├── schema (contains tables and views)
│   ├── Tables (contains tables)
│   │   ├── my-table.sql (contains create table)
│   │   └── my-table (contains columns)
│   └── Views (contains views)
│       ├── my-view.sql (contains create view)
│       └── my-view (contains columns)
├── database.csproj
└── post-deployments (contains migration scripts)
    ├── post-deployments.sql (contains create schema)
    ├── 001_create-schema.sql (contains create schema)
    ├── 002_create-table.sql (contains create table)
    ├── 003_create-view.sql (contains create view)
    └── 004_create-column.sql (contains create column)
```

## Go futher

When you will use the database as code, you can deploy your application with multiple artifact, one as your application binary file, one as your database structure. Finally let DevOps release your application as one.

## Continuous Integration 

| CI | Status | Source |
|----|--------|--------|
| Azure DevOps pipeline | [![Build Status](https://dev.azure.com/senseoftech-sandbox/vacd-db-as-code/_apis/build/status/senseoftech.vacd-database-as-code?branchName=feature%2Fadd-azure-devops-pipeline-files)](https://dev.azure.com/senseoftech-sandbox/vacd-db-as-code/_build/latest?definitionId=3&branchName=feature%2Fadd-azure-devops-pipeline-files) | [azure-pipelines.yml](./ci/azure-pipelines.yml) |
| GitHub Actions | [![Github-CI](https://github.com/senseoftech/vacd-database-as-code/actions/workflows/ci-github.yml/badge.svg)](https://github.com/senseoftech/vacd-database-as-code/actions/workflows/ci-github.yml) | [ci-github.yml](.github/workflows/ci-github.yml) |

## Continuous Deployment 

| CI | Status |
|----|--------|
| Azure DevOps pipeline | [![Deployment on Dev Status](https://vsrm.dev.azure.com/senseoftech-sandbox/_apis/public/Release/badge/8f4c5372-1aa9-4e36-9a2c-bc7e96aee650/1/1)](https://vsrm.dev.azure.com/senseoftech-sandbox/_apis/public/Release/badge/8f4c5372-1aa9-4e36-9a2c-bc7e96aee650/1/1) | 
| GitHub Actions not time to make it  | [Use SQL Azure to deploy dacpac file](https://github.com/marketplace/actions/azure-sql-deploy) |
