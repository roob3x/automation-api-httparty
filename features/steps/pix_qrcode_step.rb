
Dado('que realizo uma busca da transacao com o QRCODE {string}') do |qrcode|
  Http.headers 'cookie' => $COOKIES
  @endconded_account_id = Base64.strict_encode64(qrcode)
  body = {
    'encoded_value': "#{@endconded_account_id}"
  }
  
  @post_transaction_from_qrcode = Http.post("/pix/codes", body: body.to_json)

end

Entao('valido que é retornado o detalhe da operacao com status {int}') do |status|
  expect(@post_transaction_from_qrcode.code).to eq status
end