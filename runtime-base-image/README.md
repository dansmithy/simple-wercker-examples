
## Purpose

Demonstrates use of a common pattern of using one base image to build (that contains your build tools for example), and another base image for your runtime image. 

In Wercker you can set a Docker base image at a pipeline level, so you can do this with two separate pipelines. Consequently the second pipeline needs to use binaries built in the first pipeline.

This has a simple example of how this might be achieved.

## To run

```
./run.sh
```

This runs the following command:

```
wercker build --artifacts && \
wercker deploy --pipeline build-image --docker-local
```

Some aspects of the CLI here worth noting:

* This demonstrates running two pipelines from the CLI, where the second pipeline is able to use files written to the `$WERCKER_OUTPUT_DIR` from the first pipeline. The `--artifacts` flag makes these files available. Also the second pipeline must be run using `wercker deploy` not `wercker build`.
* Use the `--pipeline` flag when you need to specify a different pipeline name than the default name (eg. when your pipeline is not called `build`)
* Use the `--docker-local` flag in conjunction with the use of the `internal/docker-push` step in your `wercker.yml` file to avoid pushing to the remote repository specified, but instead push to your computer's local Docker image registry. That way you can instantly run a container from your image and get fast feedback on your `wercker.yml` file.

Once built, you should be able to run this Docker image:

```
docker run --rm mygithuborg/mycoolapp:latest
```

Which should print out `Nice to see your sir!` and exit :)

