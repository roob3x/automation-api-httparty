
Dado('que realizo uma busca da conta {string} do cliente') do |accountid|
  Http.headers 'cookie' => $COOKIES
  @get_accounts = Http.get "/accounts/#{accountid}"
  @sender_bank_name = @get_accounts['bank']['name']
  @sender_bank_ispb = @get_accounts['bank']['ispb']
  @sender_bank_ispb = @get_accounts['bank']['ispb']
  @sender_document = @get_accounts['document']
  @sender_name = @get_accounts['name']
end

Entao('valido que é retornado o detalhe do cliente com sucesso com status code {int}') do |status|
  expect(@get_accounts.code).to eq status
end