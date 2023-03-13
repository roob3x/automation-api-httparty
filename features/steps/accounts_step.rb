
Dado('que realizo uma busca da conta {string} do cliente') do |accountid|
  Http.headers 'cookie' => $COOKIES
  @get_accounts = Http.get "/accounts/#{accountid}"
end

Entao('valido que é retornado o detalhe do cliente com sucesso com status code {int}') do |status|
  expect(@get_accounts.code).to eq status
end