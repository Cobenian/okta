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
end
