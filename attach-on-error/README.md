
## Purpose

Demonstrates use of the `attach-on-error` wercker CLI flag.

## To run

```
./run.sh
```

You should find that you are dropped into the container, with a prompt:

```
/pipeline/source #
```

If you run `env` in this shell you can see the environment variable available to the Wercker build.