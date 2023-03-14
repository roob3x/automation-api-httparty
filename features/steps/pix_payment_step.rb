Dado('que preencho os dados minimos para realizar pagamento com pix') do
  Http.headers 'cookie' => $COOKIES
  step "que realizo uma busca da conta '62f87af90ba501353df77b95' do cliente"
  step "que realizo uma busca da transacao com o QRCODE '00020126330014BR.GOV.BCB.PIX011170326165690520400005303986540510.005802BR5911Builders 016002SP62150511PAGAMENTO0163044312'"
  @data = YAML.load_file($schema_directory)
  @data['end_to_end'] = @end_to_end
  @data['conciliation_id'] = @conciliation_id
  @data['amount'] = @total_value
  @data['recipient']['bank']['name'] = @bank_name
  @data['recipient']['bank']['ispb'] = @ispb
  @data['recipient']['document'] = @document
  @data['recipient']['name'] = @name
  @data['recipient']['key'] = @key
  @data['recipient']['key_type'] = @key_type
  @data['recipient']['key_type'] = @key_type
  @data['sender']['bank']['name'] = @sender_bank_name
  @data['sender']['bank']['ispb'] = @sender_bank_ispb
  @data['sender']['document'] = @sender_document
  @data['sender']['name'] = @sender_name
  @post_payment_pix = Http.post("/pix/payments", body: @data.to_json)
end

Entao('valido que é feito transacao com sucesso com status code {int}') do |status|
  expect(@post_payment_pix.code).to eq status
end