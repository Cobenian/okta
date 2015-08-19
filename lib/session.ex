defmodule Okta.Session do

  def create(okta, user, pw) do
       {:ok, response} = HTTPoison.post(Okta.build_url(okta, "/sessions"),    
            "{\"username\": \"#{user}\", \"password\": \"#{pw}\"}",
            Okta.headers(okta))
       Okta.decode(response)
  end

  def validate(okta, token) do
       url_to = Okta.build_url(okta, "/sessions/", token)
       {:ok, response} = HTTPoison.get(url_to, Okta.headers(okta))
       Okta.decode(response)
  end

  def extend do
    false
  end

  def close do
    false 
  end
end

