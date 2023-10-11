---
title: "Providers API"
linkTitle: "Providers API"
weight: 3
description: The Providers HTTP API provides endpoints to manage resource providers.

---

The Providers HTTP API provides endpoints to manage resource providers.

## Get All Providers

`GET /v1/providers`

Get the list of all the providers onboarded into Quasarplane.

**Required permissions**

No permissions required.

**Example Request**:

```http
GET /v1/providers
Accept: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9
```

**Example Response**:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "items": [
    {
      "id": "5cb5f266-3473-4006-984f-9325121238be",
      "externalID": "akash18ga02jzaq8cw52anyhzkwta5wygufgu6zsz6xc",
      "type": "compute",
      "partner": true,
      "organization": "Europlots",
      "email": "email@example.com",
      "hostURI": "https://provider.europlots.com:8443",
      "dateCreated": "2019-03-24T00:00:00Z",
      "dateUpdated": "2019-03-24T00:00:00Z",
      "createdBy": "5cf37266-3473-4006-984f-9325122678b7"
    },
    {
      "id": "6211fcfb-9cb5-47d5-bdc7-5ceb1a884aec",
      "externalID": "akash17gqmzu0lnh2uclx9flm755arylrhgqy7udj3el",
      "type": "compute",
      "partner": false,
      "organization": "Foundry Digital",
      "email": "hello@foundrydigital.com",
      "hostURI": "https://provider.akash.foundrystaking.com:8443/status",
      "dateCreated": "2019-03-24T00:00:00Z",
      "dateUpdated": "2019-03-24T00:00:00Z",
      "createdBy": "5cf37266-3473-4006-984f-9325122678b7"
    }
  ],
  "total": 2,
  "page": 1,
  "rowsPerPage": 10
}
```

- **200** - OK
- **401** - Unauthorized
- **500** - Internal Server Error