# Large File Searcher

A small demo app that performs literal string searches against large compressed files using [elixir](https://elixir-lang.org/install.html) and the [Flow](https://hexdocs.pm/flow/Flow.html) library to facilitate parallel computation.

## Why Elixir and Flow For This Sort of Task?

* Elixir's dynamic functional nature makes it a joy compose data processing pipelines with it.
* Elixir's out-of-box support for multicore machines along with Flow's additional parallel processing features (e.g. backpressure support via GenStage) make it well suited to safely process large volumes of data.
* Elixir is built on top of the [Erlang BEAM VM](https://en.wikipedia.org/wiki/BEAM_(Erlang_virtual_machine)), a highly fault tolerant and distributed computation environment that has been powering critical infrastructure such as telephony systems for over 30 years.

## Requirements

[elixir](https://elixir-lang.org/install.html)

## Installation

```bash
git clone git@github.com:chadfennell/lfs.git
cd lff
mix compile
```

## Demo

Locate a large compressed file and place it in the `data` directory. Download a portion of the Digital Public Library of America corpus, for example:

```bash
aws s3 cp s3://dpla-provider-export/2020/04/all.jsonl/part-00001.gz data/part-00001.gz
```

Run the search:

```bash
mix lfs.search part-00001.gz "Mexican American|Mexico|El Salvador|Hispanic|Chicano|All Souls"
```

* The first argument is the data directory file name to be searched.
* The second argument is a pipe `|` delimited set of terms to search (searches are literal string matches and case insensitive)
