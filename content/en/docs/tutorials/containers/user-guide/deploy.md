---
title: "Deploying on Container Service"
linkTitle: "Deploying on Container Service"
weight: 2
description: Learn how to deploy a container on Quasarch Container Service.
---

This page shows you how to deploy to Container Service a sample container that has already been pushed to a public registry (Docker Hub) in this case.

## Before you Begin

Make sure you are logged into [console](https://console.quasarch.cloud/) and that you have enough credits to continue.
Be sure to delete all the resources you create after completing this guide so you avoid being charged.

## Creating your Container

To create a container deployment on Container Service, you'll need to:
1. From the navigation menu select the **Compute** dropdown and then click on **Container Service**.
2. Click on **Create** to go to the form to create your container.

From here you'll have to fill out the container creation form.
Make sure that you specify a public registry path as **private registries are not yet supported**.
Don't forget to include your image tag (when using the latest tag make sure to include `latest` in the image).

### GPU Settings

Container Service supports running containers that leverage GPU support.
In case you select many different GPU models, your deployment will only run with access to one of those models.

{{% alert title="Warning" color="warning" %}}
GPUs can greatly increase the cost of running your container depending on the model.
{{% /alert %}}

Once you are satisfied with the configuration click on **Create**.
This action will redirect you to the container listing page where you'll find your deployment as *deploying*.
Quasarch Console is now waiting for Quasarplane to negotiate and send your container to one of our selected compute providers.
Once the process is complete you'll see the status of the container has changed to *deployed*.
If something went wrong the container will have its status as *failed*.

{{% alert title="Warning" color="warning" %}}
Currently every container will have its port forwarded to port 80.
Please make sure you set the `port` field correctly to point towards the container's exposed port.
{{% /alert %}}
