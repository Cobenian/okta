defmodule OktaTest do
  use ExUnit.Case

  Code.load_file("fixtures/test_settings.ex")

  test "that we can authenticate" do
    test = OktaTestSettings.test()  
    okta = Okta.init(test[:site], test[:api_token])
    ret  = Okta.Auth.authn(okta, test[:username], test[:password])
    assert ret["status"] == "SUCCESS"
    IO.inspect ret
    #assert 1 + 1 == num 
  end

  test "we can get correct error message" do
    username = "nobody@example.com"
    password = "nonsense"
    test = OktaTestSettings.test()  
    okta = Okta.init(test[:site], test[:api_token])
    ret  = Okta.Auth.authn(okta, username, password)
    assert ret["errorSummary"] == "Authentication failed"
    IO.inspect ret
  end
end
