# Resources Example

An example of retaining state and modifying state in a Rustler NIF.

## Usage

```iex
iex> {:ok, ref} = Resources.NIF.new()

iex> Resources.NIF.get(ref)
{:ok, "Hello world"}

iex> Resources.NIF.set(ref, "Hello buddy")
{:ok, "Hello buddy"}

iex> Resources.NIF.get(ref)
{:ok, "Hello buddy"}
```
