# language: pt
@sanity @qrcode_transaction
Funcionalidade: Pix QRCODE

Cenario: : Desejo buscar dados da operacao pix por QRCODE valido
    Dado que realizo uma busca da transacao com o QRCODE
    Entao valido que é retornado o detalhe da operacao com status 200
