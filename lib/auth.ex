defmodule Okta.Auth do

    def authn(okta, user, password) do
      headers = [{"Authorization", "SSWS " <> okta[:api_token]},
                 {"Accept", "application/json"},
                 {"Content-type", "application/json"}]
       {:ok, response} = HTTPoison.post(okta[:site] <> okta[:api_ver] <> "/authn",    
            "{\"username\": \"#{user}\", \"password\": \"#{password}\"}",
            headers)
       Poison.decode! response.body
    end
end

