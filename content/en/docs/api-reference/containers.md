---
title: "Container Service API"
linkTitle: "Container Service API"
weight: 2
description: The Container Service HTTP API provides endpoints to access the Container Service through HTTP.
---

The Container Service HTTP API provides endpoints to access the Container Service through HTTP.
Container Service enables you to run serverless containers that are invocable via requests abstracting away all infrastructure management, so you can focus on building great applications.

## Get All Containers

`GET /v1/containers`

Get the list of all the containers belonging to the user requesting.

**Required permissions**

No permissions required.

**Example Request**:

```http
GET /v1/containers
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
      "id": "fa71f25f-f982-4bde-bc14-1d250776325d",
      "name": "logs-debug",
      "createdBy": "5cf37266-3473-4006-984f-9325122678b7",
      "image": "nginxdemos/hello:latest",
      "cpu": 1,
      "ram": "2Gi",
      "gpu": 0,
      "ephemeralStorage": "100Gi",
      "command": null,
      "arguments": null,
      "env": {},
      "port": "80",
      "dateCreated": "2023-09-22T15:36:06Z",
      "dateUpdated": "0001-01-01T00:00:00Z",
      "status": "deployed",
      "urls": [
        "9njshomh7tb5ra3cffu55suqbs.ingress.europlots.com"
      ],
      "desiredGPUs": []
    },
  ],
  "total": 1,
  "page": 1,
  "rowsPerPage": 10
}
```

- **200** - OK
- **401** - Unauthorized
- **500** - Internal Server Error

## Get Container

`GET /v1/containers/:id`

Get a specific container by id.

**Required permissions**

No permissions required

**Example request:**

```http
GET /v1/containers/93cfc912-0660-44a7-ae26-e7e23f919659
Accept: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9
```

**Example response:**

```http
{
      "id": "93cfc912-0660-44a7-ae26-e7e23f919659",
      "name": "logs-debug",
      "createdBy": "5cf37266-3473-4006-984f-9325122678b7",
      "image": "nginxdemos/hello:latest",
      "cpu": 1,
      "ram": "2Gi",
      "gpu": 0,
      "ephemeralStorage": "100Gi",
      "command": null,
      "arguments": null,
      "env": {},
      "port": "80",
      "dateCreated": "2023-09-22T15:36:06Z",
      "dateUpdated": "0001-01-01T00:00:00Z",
      "status": "deployed",
      "urls": [
        "9njshomh7tb5ra3cffu55suqbs.ingress.europlots.com"
      ],
      "desiredGPUs": []
    }
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **403** - Forbidden
- **404** - Not Found
- **500** - Internal Server Error

## Create Container

`POST /v1/containers`

Creates and deploys a container.
{{% alert title="Warning" color="warning" %}}
Images must include the tag. Tag is not `latest` by default.
{{% /alert %}}

**Required permissions**

No permissions required.

**Example Request**:

```http
POST /v1/containers
Content-Type: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9

{
  "name": "hello-world",
  "image": "nginxdemos/hello:latest",
  "cpu": 1,
  "ram": "512Mi",
  "gpu": 0,
  "ephemeralStorage": "10Gi",
  "port": "80",
  "env": {
    "FOO": "bar"
  }
}
```

**Example Response**:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": "e91b624c-9706-4fc0-be27-83b56d0fffcd",
  "name": "hello-world",
  "createdBy": "5cf37266-3473-4006-984f-9325122678b7",
  "image": "nginxdemos/hello:latest",
  "cpu": 0.5,
  "ram": "512Mi",
  "gpu": 0,
  "ephemeralStorage": "10Gi",
  "command": null,
  "arguments": null,
  "env": {
    "FOO": "bar"
  },
  "port": "80",
  "dateCreated": "2023-09-23T17:03:36Z",
  "dateUpdated": "2023-09-23T17:03:36Z",
  "status": "deploying",
  "urls": null,
  "desiredGPUs": null
}
```

Status codes:

- **201** - Created
- **401** - Unauthorized
- **500** - Internal Server Error

## Delete Container

`DELETE /v1/containers/:id`

Delete Container.

**Required permissions**

Needs the `ADMIN` role or being the subject of the request.

**Example Request**:

```http
DELETE /v1/containers/4c00e32c-ebd4-4a0c-b62a-34d74f630b5f
Content-Type: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9
```

**Example Response**:

```http
HTTP/1.1 204 No Content
```

Status codes:

- **204** - No Content
- **401** - Unauthorized
- **403** - Forbidden
- **404** - Not Found
- **500** - Internal Server Error

## Update Container

`PUT /v1/containers/:id`

Update a Container.
This creates a new revision and deploys it.

**Required permissions**

Needs the `ADMIN` role or being the subject of the request.

**Example Request**:

```http
PUT /v1/containers/6aae435c-e3e6-4976-a5e0-f99a9f930e44
Content-Type: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9

{
  "image": "nginxdemos/hello:updated",
  "env": {
    "FOO": "updated-bar"
  }
}
```

**Example Response**:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "6aae435c-e3e6-4976-a5e0-f99a9f930e44",
  "name": "cool-service",
  "createdBy": "5cf37266-3473-4006-984f-9325122678b7",
  "image": "nginxdemos/hello:updated",
  "cpu": 0.5,
  "ram": "2Gi",
  "gpu": 1,
  "ephemeralStorage": "20Gi",
  "command": null,
  "arguments": null,
  "env": {
    "FOO": "updated-bar"
  },
  "port": "8080",
  "dateCreated": "2019-03-24T00:00:00Z",
  "dateUpdated": "2023-09-23T17:04:53Z",
  "status": "deploying",
  "urls": [
    "lol.example.com",
    "lol-api.example.com"
  ],
  "desiredGPUs": [
    "Nvidia a100",
    "Nvidia tesla-p4"
  ]
}
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **403** - Forbidden
- **404** - Not Found
- **500** - Internal Server Error

## Get Container Revisions

`GET /v1/containers/:id/revisions`

Get revisions of a Container.

**Required permissions**

Needs the `ADMIN` role or being the subject of the request.

**Example Request**:

```http
GET /v1/containers/6aae435c-e3e6-4976-a5e0-f99a9f930e44/revisions
Content-Type: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9
```

**Example Response**:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "items": [
    {
      "containerID": "6aae435c-e3e6-4976-a5e0-f99a9f930e44",
      "revisionNumber": 3,
      "image": "nginxdemos/hello:updated",
      "dateCreated": "2023-09-23T17:04:53Z"
    },
    {
      "containerID": "6aae435c-e3e6-4976-a5e0-f99a9f930e44",
      "revisionNumber": 2,
      "image": "ghcr.io/kubernetes-sigs/cluster-api/cluster-api-controller:v0.1.4",
      "dateCreated": "2019-03-24T00:00:00Z"
    },
    {
      "containerID": "6aae435c-e3e6-4976-a5e0-f99a9f930e44",
      "revisionNumber": 1,
      "image": "ghcr.io/kubernetes-sigs/cluster-api/cluster-api-controller:v0.0.1",
      "dateCreated": "2019-02-20T00:00:00Z"
    }
  ],
  "total": 3,
  "page": 1,
  "rowsPerPage": 10
}
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **403** - Forbidden
- **404** - Not Found
- **500** - Internal Server Error
- 
## Get Container Logs

`GET /v1/containers/:id/logs`

Get the logs of the container.
Creates an HTTP event stream for the log data.

**Required permissions**

No permissions required

**Example Request**:

```http
GET /v1/containers/6aae435c-e3e6-4976-a5e0-f99a9f930e44/logs
Content-Type: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **404** - Not Found
- **500** - Internal Server Error

## Get GPU Models

`GET /v1/gpu-models`

Get the list of GPU models supported.

**Required permissions**

No permissions required.

**Example Request**:

```http
GET /v1/gpu-models
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
      "code": "h100",
      "name": "Nvidia h100"
    },
    {
      "code": "a100",
      "name": "Nvidia a100"
    },
    {
      "code": "a40",
      "name": "Nvidia a40"
    },
    {
      "code": "a16",
      "name": "Nvidia a16"
    },
    {
      "code": "t4",
      "name": "Nvidia t4"
    },
    {
      "code": "v100",
      "name": "Nvidia v100"
    },
    {
      "code": "p4",
      "name": "Nvidia tesla-p4"
    },
    {
      "code": "p100",
      "name": "Nvidia tesla-p100"
    },
    {
      "code": "k80",
      "name": "Nvidia tesla-k80"
    },
    {
      "code": "3050",
      "name": "Nvidia rtx-3050"
    },
    {
      "code": "3060",
      "name": "Nvidia rtx-3060"
    },
    {
      "code": "3060ti",
      "name": "Nvidia rtx-3060-ti"
    },
    {
      "code": "3070",
      "name": "Nvidia rtx-3070"
    },
    {
      "code": "3070ti",
      "name": "Nvidia rtx-3070-ti"
    },
    {
      "code": "3080",
      "name": "Nvidia rtx-3080"
    },
    {
      "code": "3080ti",
      "name": "Nvidia rtx-3080-ti"
    },
    {
      "code": "3090",
      "name": "Nvidia rtx-3090"
    },
    {
      "code": "3090ti",
      "name": "Nvidia rtx-3090-ti"
    },
    {
      "code": "1050",
      "name": "Nvidia gtx-1050"
    },
    {
      "code": "1050ti",
      "name": "Nvidia gtx-1050-ti"
    },
    {
      "code": "1060",
      "name": "Nvidia gtx-1060"
    },
    {
      "code": "1070",
      "name": "Nvidia gtx-1070"
    },
    {
      "code": "1070ti",
      "name": "Nvidia gtx-1070-ti"
    },
    {
      "code": "1080",
      "name": "Nvidia gtx-1080"
    },
    {
      "code": "1080ti",
      "name": "Nvidia gtx-1080-ti"
    }
  ],
  "total": 25,
  "page": 1,
  "rowsPerPage": 100
}
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **500** - Internal Server Error
