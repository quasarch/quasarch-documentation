---
title: "Privacy"
linkTitle: "Privacy"
weight:
description: Data privacy on Quasarch Cloud Platform
---

As a solution that enables Tenants with self-sovereignty over their data, Tenants can choose where they want to run their workloads and store their data.
Quasarch Cloud Platform can serve as a privacy layer between Tenants and [Providers](../providers.md).
Providers do not have access to the Quasarch Cloud Platform account that is accessing resources.

## Compute Providers Data Access
Compute Providers will run Tenant workloads on their infrastructure and by deploying Tenants are trusting them with their data.
They are required to manage workloads in a secure and responsible way and provide transparency to their Tenants.

Compute Providers might have access to the following data:
- Environment variables
- Unencrypted files
- Unencrypted network traffic

It is recommended that you design your applications with an emphasis on security whether you are trusting a centralized Cloud Provider or a decentralized Cloud Provider.
At any time Tenants can query Provider data to help them make informed choices based on their specific requirements for security.
For more information on what attributes you can have query check the [Providers API Reference](../api-reference)
