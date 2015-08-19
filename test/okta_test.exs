defmodule OktaTest do
  use ExUnit.Case

  Code.load_file("fixtures/test_settings.ex")

  test "that we can authenticate" do
    test = OktaTestSettings.test()  
    okta = Okta.init(test[:site], test[:api_token])
    ret  = Okta.Auth.authn(okta, test[:username], test[:password])
    assert ret["status"] == "SUCCESS"
    IO.inspect ret
  end

  test "we can create a session and validate it" do
    IO.puts "creating a session and validating"
    test = OktaTestSettings.test()  
    okta = Okta.init(test[:site], test[:api_token])
    ret = Okta.Session.create(okta, test[:username], test[:password])
    assert true == Dict.has_key?(ret, "id")
    IO.inspect(ret)
    val_ret  = Okta.Session.validate(okta, ret["id"])
    assert true == Dict.has_key?(val_ret, "id")
    IO.inspect val_ret
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
