# GenServerCallbacks

An example of asynchronous work in Rust calling back into an Elixir process.

## Usage

    iex> {:ok, pid} = GenServerCallbacks.start_link()
    iex> GenServerCallbacks.get(pid)
    "Hello world"

    iex> :ok = GenServerCallbacks.set(pid, "Hello moon")
    iex> GenServerCallbacks.get(pid)
    "Hello moon"

