defmodule MailgunTest do
  use ExUnit.Case
  doctest Mailgun

  @valid_email "max.muster@test.de"
  @invalid_email "random string @ .de"
  
  @email %{from: "info@house1.de", to: "info@house1.de",subject: "test email", text: "test","o:testmode": true}


  	test "valid email" do
		assert Mailgun.email_validation(@valid_email) == true
  	end
	
	test "invalid email" do
		assert Mailgun.email_validation(@invalid_email) == false
	end
	
	test "deliver email" do 
		response = Mailgun.deliver(@email)
		assert response.status_code == 200
	end
	
end
