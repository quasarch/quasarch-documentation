---
title: "Users API"
linkTitle: "Users API"
weight: 1
---

The Users HTTP API provides endpoints for user management and authentication.

## Login

`GET /v1/users/token`

Only works with Basic Authentication (username and password).

**Example Request**:

```http
GET /v1/users/token
Accept: application/json
Authorization: Basic dXNlckBleGFtcGxlLmNvbTpwYXNzd29yZA==
```

**Example Response**:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "token": "<jwt>"
}
```

## Create User

`POST /v1/users`

Create/register a new user.

**Required permissions**

No permissions required

**Example request:**

```http
POST /v1/users
Accept: application/json

{
  	"name": "Bob Smith",
  	"email": "bob@example.com",
	"password": "bob123",
	"passwordConfirm": "bob123"
}
```

**Example response:**

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": "33bdf6ce-a26e-4b52-80d2-f26d12245cce",
  "name": "Bob Smith",
  "email": "bob@example.com",
  "roles": [
    "USER"
  ],
  "enabled": true,
  "dateCreated": "2023-09-21T16:12:09Z",
  "dateUpdated": "2023-09-21T16:12:09Z"
}
```

Status codes:

- **201** - Created
- **400** - Bad Request
- **500** - Internal Server Error

## Delete User

`DELETE /v1/users/:id`

Delete the given user from the system. This endpoint deletes the current data regarding the user.

**Required permissions**

Needs the `ADMIN` role.

**Example Request**:

```http
DELETE /v1/users/33bdf6ce-a26e-4b52-80d2-f26d12245cce
Accept: application/json
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

## Get All Users

`GET /v1/users`

Get the list of users.

**Required permissions**

Needs the `ADMIN` role.

**Example Request**:

```http
GET /v1/users
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
      "id": "45b5fbd3-755f-4379-8f07-a58d4a30fa2f",
      "name": "User Gopher",
      "email": "user.gopher@example.com",
      "roles": [
        "USER"
      ],
      "enabled": true,
      "dateCreated": "2019-03-24T00:00:00Z",
      "dateUpdated": "2019-03-24T00:00:00Z"
    },
    {
      "id": "5cf37266-3473-4006-984f-9325122678b7",
      "name": "Admin Gopher",
      "email": "admin.gopher@example.com",
      "roles": [
        "ADMIN",
        "USER"
      ],
      "enabled": true,
      "dateCreated": "2019-03-24T00:00:00Z",
      "dateUpdated": "2019-03-24T00:00:00Z"
    }
  ],
  "total": 2,
  "page": 1,
  "rowsPerPage": 10
}
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **403** - Forbidden
- **500** - Internal Server Error

## Get User

`GET /v1/users/:id`

Query a specific user.

**Required permissions**

Needs the `ADMIN` role or being the subject of the request.

**Example Request**:

```http
GET /v1/users/33bdf6ce-a26e-4b52-80d2-f26d12245cce
Accept: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9
```

**Example Response**:

```http
HTTP/1.1 200 Created
Content-Type: application/json

{
  "id": "33bdf6ce-a26e-4b52-80d2-f26d12245cce",
  "name": "Bob Smith",
  "email": "bob@example.com",
  "roles": [
    "USER"
  ],
  "enabled": true,
  "dateCreated": "2023-09-21T16:12:09Z",
  "dateUpdated": "2023-09-21T16:12:09Z"
}
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **403** - Forbidden
- **404** - Not Found
- **500** - Internal Server Error

## Get User Crypto Addresses

`GET /v1/users/:id/addresses`

Get a specific user's crypto addresses.

**Required permissions**

Needs the `ADMIN` role or being the subject of the request.

**Example Request**:

```http
GET /v1/users/45b5fbd3-755f-4379-8f07-a58d4a30fa2f/addresses
Accept: application/json
Authorization: Bearer eyJFZXdEG1pZWmNrMkZYbkUlrIjoiT0tTcaDFsNY2RnVKZTFV9
```

**Example Response**:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "akash": "akash1gxglu3ny085vnwearp3kf6tvhw2c7dya9ltn7q"
}
```

Status codes:

- **200** - OK
- **401** - Unauthorized
- **403** - Forbidden
- **404** - Not Found
- **500** - Internal Server Error