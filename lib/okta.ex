defmodule Okta do

  # we will need this to start
  def init(site, api_token) do
    %{ :site => site,
       :api_token => api_token,
       :api_ver => "/api/v1"
     }
  end

  def headers(okta) do
    [{"Authorization", "SSWS " <> okta[:api_token]},
      {"Accept", "application/json"},
      {"Content-type", "application/json"}]
  end
  
  def decode(json) do
    Poison.decode! json.body
  end

  def build_url(okta, url) do
    okta[:site] <> okta[:api_ver] <> url
  end

  def build_url(okta, url, arg) do
    okta[:site] <> okta[:api_ver] <> url <> arg
  end

  def debug(arg) do
    IO.puts("[DEBUG] " <> arg)
  end
end
