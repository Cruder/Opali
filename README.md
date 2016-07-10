# Opali

Opali is an Opensource API server.

With Opali, you will be able to create your API quickly and safely.


## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  Opali:
    github: Cruder/Opali
```


## Usage


```crystal
require "Opali"
```

```crystal
options = { port: 8080 }
Opali::Server.new(options).start
```

## Development

Please comme to [taiga.io](https://tree.taiga.io/project/alex-lairan-opali/)
to see our tasks before create your own.

## Contributing

1. Fork it ( https://github.com/Cruder/Opali/fork )
2. Create your feature branch (git checkout -b [TYPE]/[TAIGA-ID]/my-branch)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin [TYPE]/[TAIGA-ID]/my-branch)
5. Create a new Pull Request

[TYPE] is the type of your branch.

[TYPE] can be:
- feature
- enhance
- fix
- refactor
- doc

[TAIGA-ID] is the id of the task on taiga.io

## Contributors

- [alex-lairan](https://github.com/alex-lairan) alex-lairan - creator, maintainer
- [amelie-certin](https://github.com/amelie-certin) amelie-certin - creator, maintainer
