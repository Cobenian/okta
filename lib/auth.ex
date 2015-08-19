defmodule Okta.Auth do

    def authn(okta, user, password) do
       {:ok, response} = HTTPoison.post(okta[:site] <> okta[:api_ver] <> "/authn",    
            "{\"username\": \"#{user}\", \"password\": \"#{password}\"}",
            Okta.headers(okta))
       Poison.decode! response.body
    end
end

