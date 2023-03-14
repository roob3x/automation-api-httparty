# language: pt
@qrcode_transaction
Funcionalidade: Pix QRCODE

@sanity @qrcode_valido
Esquema do Cenario: Desejo buscar dados da operacao pix por QRCODE valido
    Dado que realizo uma busca da transacao com o QRCODE "<qrcode>"
    Entao valido que é retornado o detalhe da operacao com status 200

Exemplos:
    | qrcode                                                                                                                    |
    | 00020126330014BR.GOV.BCB.PIX011170326165690520400005303986540510.005802BR5911Builders 016002SP62150511PAGAMENTO0163044312 |
    | 00020126330014BR.GOV.BCB.PIX011170326165690520400005303986540520.005802BR5911Builders 016002SP62150511PAGAMENTO0163044312 |
    | 00020126330014BR.GOV.BCB.PIX011170326165690520400005303986540550.005802BR5911Builders 016002SP62150511PAGAMENTO0163044312 |
    | 00020126330014BR.GOV.BCB.PIX011170326165690520400005303986540550.005802BR5911Builders 016002SP62150512PAGAMENTO0163044312 |

@qrcode_invalido
Cenario: Verifico que é retornado critica para qrcode invalido
    Dado que realizo uma busca da transacao com o QRCODE "62f87af90ba501353df77b95"
    Entao valido que é retornado o detalhe da operacao com status 404