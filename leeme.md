<h1>Summary</h1>
This repo contains a numner of docker compose yaml files to test some of the microservices or stand alone or 
integrated with any other microservice
Most of the services contain an .env file to inject dependencies.

<h2>controller_db_server</h2>
<h3>Overview</h3>
Just to test that controller_db_server starts up, loads guinicorn and stays waiting for requests.  
<h3>Files</h3>
- docker_compose-controller_db_server.yaml
- env_controller_db_server
```commandline
docker compose --env-file env_controller_db_server.env -f docker-compose_controller_db_server.yaml -p miguel up --build
```
<h2>assetizer</h2>
<h3>Overview</h3>
Just to test that assetizer starts up, loads guinicorn and stays waiting for requests.  
<h3>Files</h3>
docker-compose_assetizer.yaml
env_assetizer.env
```commandline
docker compose --env-file env_assetizer.env -f docker-compose_assetizer.yaml -p miguel up --build

```

<h2>transcript</h2>
<h3>Overview</h3>
Just to test that transcript starts up, loads guinicorn and stays waiting for requests.  
<h3>Files</h3>
docker-compose_transcript.yaml
env_transcript.yaml
```commandline
docker compose --env-file env_transcript.env -f docker-compose_transcript.yaml -p miguel up --build

```

<h2>recorder</h2>
<h3>stand alone</h3>
Just to test that recorder starts up, loads guinicorn and stays waiting for requests.  
<h3>Files</h3>
docker-compose_recorder_only.yaml
env_recorder_only.env
```commandline
docker compose --env-file env_recorder_only.env -f docker-compose_recorder_only.yaml -p miguel up --build

```
<h3>Partially integrated</h3>
To test the recorder integrated with:
- controller_db_server
- assetizer
- transcript.
<h3>Files</h3>
docker-compose_recorder_all.yaml
env_recorder_all.env


