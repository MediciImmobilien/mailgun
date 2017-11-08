defmodule Mailgun do
	@config Application.get_env(:mailgun, :credentials)
	@url "api.mailgun.net/v3"
	
	def deliver(email), do: HTTPoison.post!(url(), email |> Plug.Conn.Query.encode, headers())   

	def email_validation(address), do: address |> url |> HTTPoison.get! |> handle_response

    def auth_token(), do: "api:#{@config[:api_key]}" |> Base.encode64
	
    def url(), do: "https://#{@url}/#{@config[:domain]}/messages"

    def headers(), do: [{"Content-Type", "application/x-www-form-urlencoded"},{"Authorization", "Basic #{auth_token()}"}]
	
	def url(address), do: "https://api:#{@config[:email_validation_key]}@#{@url}/address/validate?address=#{URI.encode(address)}"
	
	def handle_response(%{body: body}), do: body |> Poison.decode! |> Map.get("is_valid")
end