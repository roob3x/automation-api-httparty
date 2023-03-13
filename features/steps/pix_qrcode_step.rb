
Dado('que realizo uma busca da transacao com o QRCODE') do
  Http.headers 'cookie' => $COOKIES
  @endconded_account_id = Base64.strict_encode64('00020126330014BR.GOV.BCB.PIX011170326165690520400005303986540510.005802BR5911Builders 016002SP62150511PAGAMENTO0163044312')
  body = {
    'encoded_value': "#{@endconded_account_id}"
  }
  
  @post_transaction_from_qrcode = Http.post("/pix/codes", body: body.to_json)
  @end_to_end = @post_transaction_from_qrcode['end_to_end']
  @conciliation_id = @post_transaction_from_qrcode['conciliation_id']
end

Entao('valido que é retornado o detalhe da operacao com status {int}') do |status|
  expect(@post_transaction_from_qrcode.code).to eq 200
  expect(@post_transaction_from_qrcode['end_to_end']).to eq 'c74205c0-5f7b-4ee2-8fab-ef646c408fff'
  expect(@post_transaction_from_qrcode['conciliation_id']).to eq '95225008-6c6b-4310-821a-72dfe634c24e'
  expect(@post_transaction_from_qrcode['total_value']).to eq '10'
  expect(@post_transaction_from_qrcode['holder']['document']).to eq '70326165690'
  expect(@post_transaction_from_qrcode['holder']['name']).to eq 'Builders'
  expect(@post_transaction_from_qrcode['holder']['key']).to eq '70326165690'
  expect(@post_transaction_from_qrcode['holder']['key_type']).to eq 'CPF'
  expect(@post_transaction_from_qrcode['holder']['bank']['name']).to eq 'Banco do Brasil'
  expect(@post_transaction_from_qrcode['holder']['bank']['ispb']).to eq '0001'
end