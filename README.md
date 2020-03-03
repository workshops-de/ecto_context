# Ecto Context

![CI](https://github.com/sbrink/ecto_context/workflows/CI/badge.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/sbrink/ecto_context/badge.svg?branch=master)](https://coveralls.io/github/sbrink/ecto_context?branch=master)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/sbrink/ecto_context/blob/master/LICENSE)
[![Hex.pm](https://img.shields.io/hexpm/v/ecto_context.svg)](https://hexdocs.pm/ecto_context)

Non-magic context generation for ecto

## Why

The current way we use contexts with ecto is broken. Using less magic made a big
improvment for me after serveral years with Rails. The problem is we're writing
the same wrapper methods in contexts over and over again - with only little variation.
The result is a lot of noise in your code. When browse through your contexts it
hard to spot the difference in comparision to another context.

That said, it would be easy enough to generate all the functions with a macro.
And indeed that was my first approach (If you prefer this way, look at
[contextual]() or [lazy_context]()).As I was not born with a perfect memory,
I often had to look at the generator itself to figure out the function names.
And team members were not happy either when someone made an improvement to the
generator.

This led me to the current approch: The magic code is written to the context block
surrounded by special comment (yes, you can change them ;))

## How it works

The definition of your context actions is done similar to the phoenix generator.
You have and file `context.ex.eex` which contains all the functions which can
be generated in your context.



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ecto_context` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ecto_context, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ecto_context](https://hexdocs.pm/ecto_context).

## License

MIT © Sascha Brink
