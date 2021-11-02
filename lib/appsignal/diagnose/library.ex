defmodule Appsignal.Diagnose.Library do
  @moduledoc false

  require Appsignal.Utils

  @appsignal_version Mix.Project.config()[:version]
  @agent_version Appsignal.Nif.agent_version()
  @nif Appsignal.Utils.compile_env(:appsignal, :appsignal_nif, Appsignal.Nif)

  def info do
    %{
      language: "elixir",
      agent_version: @agent_version,
      package_version: @appsignal_version,
      extension_loaded: @nif.loaded?()
    }
  end
end
