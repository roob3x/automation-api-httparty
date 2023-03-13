# language: pt
@sanity @account
Funcionalidade: Conta

Esquema do Cenario: : Verifico que é possivel pesquisar conta valida
    Dado que realizo uma busca da conta "<accountid>" do cliente
    Entao valido que é retornado o detalhe do cliente com sucesso com status code 200

Exemplos:
    | accountid                |
    | 62f87af90ba501353df77b95 |
    | 630932fc327fb162f0d8e72c |
    | 630933566e9f1d5128cf4c00 |