# MognoREST

A small sandbox project to learn and demo TypeScript with Express with Mongoose/MongoDB and Docker.

## Prerequisites

- Docker
- Docker Compose
- Internet connection
- Free TCP ports: `3000` and `3001`
- Bash
- `curl` and `jq` for `test.sh`

## How to use

To start app (incl. fetching Docker images from the internet):

```console
# bin/cmd-compose-up.sh
```

To stop app and remove all its running containers:

```console
# bin/cmd-compose-down.sh
```

To test, just use any REST client or run `bin/test.sh`. See also `example-rest-calls.http` if you happen
to use the `REST Client` extension in *VSCode*.

`test.sh` assumes the app URL to be `http://localhost:3000/` - adjust in the script, if needed.

```console
# bin/test.sh

Batch run: w1bWi

Creating 10 cards
  --> 6095c648a78508002054b5fe  Task w1bWi 1    low
  --> 6095c648a78508002054b5ff  Task w1bWi 2    high
  --> 6095c648a78508002054b600  Task w1bWi 3    high
  --> 6095c648a78508002054b601  Task w1bWi 4    high
  --> 6095c648a78508002054b602  Task w1bWi 5    mid
  --> 6095c648a78508002054b603  Task w1bWi 6    high
  --> 6095c648a78508002054b604  Task w1bWi 7    mid
  --> 6095c648a78508002054b605  Task w1bWi 8    high
  --> 6095c648a78508002054b606  Task w1bWi 9    high
  --> 6095c648a78508002054b607  Task w1bWi 10   high

All cards
  --> 6095c648a78508002054b5fe  Task w1bWi 1    low
  --> 6095c648a78508002054b5ff  Task w1bWi 2    high
  --> 6095c648a78508002054b600  Task w1bWi 3    high
  --> 6095c648a78508002054b601  Task w1bWi 4    high
  --> 6095c648a78508002054b602  Task w1bWi 5    mid
  --> 6095c648a78508002054b603  Task w1bWi 6    high
  --> 6095c648a78508002054b604  Task w1bWi 7    mid
  --> 6095c648a78508002054b605  Task w1bWi 8    high
  --> 6095c648a78508002054b606  Task w1bWi 9    high
  --> 6095c648a78508002054b607  Task w1bWi 10   high

One random card
  --> 6095c648a78508002054b603  Task w1bWi 6    high
```

**Hint:** You can also use *Mongo Express* on port `3001` to inspect the data.

## Noteworthy

- The ***In-Memory Storage Engine*** is only
  [available in MongoDB Enterprise](https://docs.mongodb.com/manual/core/storage-engines/),
  [not the community edition](https://jira.mongodb.org/browse/SERVER-24870?focusedCommentId=1311924&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-1311924).
