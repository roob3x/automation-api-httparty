Dado('que preencho os dados minimos para realizar pagamento com pix') do
  Http.headers 'cookie' => $COOKIES
  step "que realizo uma busca da transacao com o QRCODE '00020126330014BR.GOV.BCB.PIX011170326165690520400005303986540510.005802BR5911Builders 016002SP62150511PAGAMENTO0163044312'"
  @data = YAML.load_file($schema_directory)
  @data = @data.to_json
  body = {
    "end_to_end": "#{@end_to_end}",
    "conciliation_id": "#{@conciliation_id}"
  }
  @post_payment_pix = Http.post("/pix/payments", body: @data.to_json)
end

Entao('valido que é feito transacao com sucesso com status code {int}') do |status|
  expect(@post_payment_pix.code).to eq status
end