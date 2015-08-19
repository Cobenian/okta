defmodule Okta.Auth do

    def authn(okta, user, password) do
       {:ok, response} = HTTPoison.post(Okta.build_url(okta, "/authn"),    
            "{\"username\": \"#{user}\", \"password\": \"#{password}\"}",
            Okta.headers(okta))
       Okta.decode(response) 
    end
end

