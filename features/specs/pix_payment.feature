# language: pt
@sanity @pagamento_pix
Funcionalidade: Pagamento com pix

Cenario: : Verifico que é possivel realizar pagamento com pix por qrcode com dados validos
    Dado que preencho os dados minimos para realizar pagamento com pix
    Entao valido que é feito transacao com sucesso com status code 200