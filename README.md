# AddressConverter

Converts addresses into different formats.
Currently supports EVM (H160) addresses into Substrate (SS58).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `address_converter` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:address_converter, "~> 0.1.0"}
  ]
end
```

## Usage
Convert an EVM address into a Substrate one:
```elixir
AddressConverter.to_ss58("0x10E0271ec47d55511a047516f2a7301801d55eaB")
"5GDXvqASMPKNbnmSEt69CkbL6YwiN3sLbVqdPFW4cvC43zSH"
```

## Docs
Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/address_converter>.

