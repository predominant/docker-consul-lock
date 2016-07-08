# Docker based Consul Lock test

This was created while I was trying to determine how to write an example of how [Consul Lock][consul-lock] works practically. This was done for my own learning purposes, and to demonstrate to colleagues.

## The example

This spawns a trivial BASH process that outputs periods `.`.

Assume for a moment that your business is reliant on these periods being output every 0.5 seconds. But only one at a time.

So you need at least one server running, outputting periods while hot standby servers are available to take over in the event of failure.

[Consul Lock][consul-lock] allows us to ensure only one process can run at a time, and coordinates that with the cluster.

You can read all about Consul on the [Consul website][consul].

## Shell Script

The `crashy.sh` is the main process we need running.

Its been developed in such a way that it will run, but randomly quit after 1-10 seconds. This will change each time it is run.

The docker entrypoint has been built to restart the consul lock / crashy service after it exits, so it rejoins the cluster attempting to get hold of the lock to become the cluster process owner.

[consul]: https://www.consul.io
[consul-lock]: https://www.consul.io/docs/commands/lock.html
