---
title: "Container Service API"
linkTitle: "Container Service API"
weight: 2
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
TODO
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
TODO
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
TODO
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
PUT /v1/containers/4c00e32c-ebd4-4a0c-b62a-34d74f630b5f
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
TODO
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
GET /v1/containers/4c00e32c-ebd4-4a0c-b62a-34d74f630b5f/revisions
Content-Type: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9
```

**Example Response**:

```http
TODO
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **403** - Forbidden
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
TODO
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **500** - Internal Server Error
