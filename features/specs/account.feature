# language: pt
Funcionalidade: Conta

@sanity @account_valida
Esquema do Cenario: : Verifico que é possivel pesquisar conta valida
    Dado que realizo uma busca da conta "<accountid>" do cliente
    Entao valido que é retornado o detalhe do cliente com sucesso com status code 200

Exemplos:
    | accountid                |
    | 62f87af90ba501353df77b95 |
    | 630932fc327fb162f0d8e72c |
    | 630933566e9f1d5128cf4c00 |

@account_invalida
Cenario: : Verifico que é retornado critica para conta invalida
    Dado que realizo uma busca da conta "630932fc327fb162f0d8e23c" do cliente
    Entao valido que é retornado o detalhe do cliente com sucesso com status code 404