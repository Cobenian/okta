defmodule Okta do

  # we will need this to start
  def init(site, api_token) do
    %{ :site => site,
       :api_token => api_token,
       :api_ver => "/api/v1"
     }
  end
end
