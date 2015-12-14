# icarters
Icarters pet shop
## Start postgres container:

```shell
$ docker run --name db -p 5432:5432 -e POSTGRES_PASSWORD=icarters postgres
```
---
Compile styles and start watching scss changes:

```shell
$ gulp && gulp watch
```