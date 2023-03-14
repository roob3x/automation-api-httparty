
Dado('que realizo uma busca da transacao com o QRCODE {string}') do |qrcode|
  Http.headers 'cookie' => $COOKIES
  @endconded_account_id = Base64.strict_encode64(qrcode)
  body = {
    'encoded_value': "#{@endconded_account_id}"
  }
  
  @post_transaction_from_qrcode = Http.post("/pix/codes", body: body.to_json)
  @end_to_end = @post_transaction_from_qrcode['end_to_end']
  @conciliation_id = @post_transaction_from_qrcode['conciliation_id']
  @total_value = @post_transaction_from_qrcode['total_value']
  @document = @post_transaction_from_qrcode['holder']['document']
  @name = @post_transaction_from_qrcode['holder']['name']
  @key = @post_transaction_from_qrcode['holder']['key']
  @key_type = @post_transaction_from_qrcode['holder']['key_type']
  @bank_name = @post_transaction_from_qrcode['holder']['bank']['name']
  @ispb = @post_transaction_from_qrcode['holder']['bank']['ispb']

end

Entao('valido que é retornado o detalhe da operacao com status {int}') do |status|
  expect(@post_transaction_from_qrcode.code).to eq status
end