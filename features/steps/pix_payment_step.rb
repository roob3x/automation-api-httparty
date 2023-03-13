Dado('que preencho os dados minimos para realizar pagamento com pix') do
  Http.headers 'cookie' => $COOKIES
  step "que realizo uma busca da transacao com o QRCODE"
  body = {
    "end_to_end": "#{@end_to_end}",
    "conciliation_id": "#{@conciliation_id}"
  }
  @post_payment_pix = Http.post("/pix/payments", body: body.to_json)
end

Entao('valido que é feito transacao com sucesso com status code {int}') do |status|
  expect(@post_payment_pix.code).to eq status
end