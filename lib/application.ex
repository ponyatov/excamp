#  powered by metaL: https://github.com/ponyatov/metaL/wiki/metaL-manifest
defmodule Excamp.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Camp.Worker.start_link(arg)
      # {Excamp.Worker, arg}
    ]

    # \ <section:start>
    cowboy()
    # / <section:start>
    opts = [strategy: :one_for_one, name: Excamp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # \ <section:module>
  @port 12345
  @procs 0x10
  defp cowboy do
    index = {"/", Excamp.Web, :index}
    about = {"/about", Excamp.Web, :about}
    undef = {:_, Excamp.Web, :undef}
    routes = [index, about, undef]
    dispatch = :cowboy_router.compile([{:_, routes}])
    opts = [port: @port]
    env = [dispatch: dispatch]

    case :cowboy.start_http(:http, @procs, opts, env: env) do
      {:ok, _pid} -> IO.puts("Cowboy runs @ http://localhost:#{@port}")
      err -> IO.puts("Cowboy error #{err}")
    end
  end

  # / <section:module>
end
