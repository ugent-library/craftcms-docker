# Docker CraftCMS

**02.09.2021: DEPRECATED | EXPERIMENTAL**

A Docker stack [CraftCMS](https://craftcms.com/).

## Setup

Install the codebase with Composer in the `app/` directory:

```bash
$ docker run --rm -it --volume $PWD:/app --user 1000:1000 composer composer create-project craftcms/craft app -n
```

Run docker-compose...

```bash
$ docker-compose up -d
```

... or docker swarm

```bash
$ docker stack deploy -c docker-stack.yml craftcms
```

Navigate to
[http://127.0.0.1:8080/admin/install](http://127.0.0.1:8080/admin/install) and
follow the installation steps.

Configuration will be written to the `app/.env` file. The installer will also
initialize all relations in the PostgreSQL database.

The installation was concluded successfully if you end up on the administrative
dashboard of your CraftCMS project.

## Database settings

Driver=postgres
server=postgres (in swarm: craftcms_postgres)
port=5432
username=craftcms
password=craftcms
database=craftcms

## Tearing everything down

Either use `docker-compose down` or `docker stack rm craftcms` to stop and
remove all containers. The database is stored as a docker volume and shouldn't
be touched. Use `docker volume ls` and `docker volume rm` to find/remove them
as well if you need to. The files themselves remain persistent in the `app` 
directory as well.
