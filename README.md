# Infrastructure as Code ... Vegan-style - DEMO - Infrastructure

> This repository contains the OpenTofu files required to setup the Demo infrastructure for "Infrastructure as Code ... Vegan-style" presentation

## Technologies Used

- **[OpenTofu](https://opentofu.org/)**: An open-source Infrastructure as Code tool forked from [Terraform](https://www.terraform.io/), used for provisioning and managing cloud resources.
- **[Cloudflare](https://www.cloudflare.com/)**: A cloud-based platform that provides a suite of services for security, performance, and reliability of web applications and APIs, including content delivery network (CDN), DNS, and security features.

## Key Features

- Declarative infrastructure definition
- Modular and reusable code structure
- Automated provisioning and management of cloud resources
- Version-controlled infrastructure changes

## Setup

- Initialize OpenTofu project

  ```sh
  tofu init
  ```

- Copy sample file and set Variables

  ```sh
  cp terraform.tfvars.sample terraform.tfvars
  nano terraform.tfvars
  ```

- Check changes to be applied via OpenTofu

  ```sh
  tofu plan
  ```

- Apply changes

  ```sh
  tofu apply
  ```

- :warning: Destroy generated resources

  ```sh
  tofu destroy
  ```
