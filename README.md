# .NET 8 web API Dockerfile setup
This is just the Dockerfile for a .net 8 API setup (Can be useful when you want to build a microservice architecture a)

## How to create and containerize a new .net 8 API project
*Note: This setup is done on a windows 10 machine. Any other OS might require some extra configurations or other resources.*

**Prerequisites**

* .Net SDK 
    - Download link [here](https://dotnet.microsoft.com/en-us/download)
* Docker Desktop 
    - Download link [here](https://www.docker.com/get-started/)


**Create a new web API project**

```bash
dotnet new webapi --use-controllers -o <Project-name>
cd <Project-name>
```

**Initialize docker**

```bash
docker init
```

When excecuting the docker init command you're probably gonna be promted with a few questions regarding the project type. After answering accordingly, 4 files will be generated by the command one of which is the Dockerfile that you will replace with the one located in this repository. Then you can replace the "TestAPI" in the Dockerfile with the project name that you provided.

After having that setup, we can now proceed into building the Docker Container for our project.

**Build the Docker Image**

```bash
docker build -t image-name .
```

**Run the Docker Container**

```bash
docker run -p 5001:5001 image-name
```

This command will run the container in non-detached mode so that we can spot errors and will bind the port 5001 on your localhost. 
