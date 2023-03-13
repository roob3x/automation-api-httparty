Este projeto tem como objetivo realizar testes automatizados de backend utilizando ruby com httparty e cucumber para facilitar a descricao dos cenarios que serao validados.
para que seja possivel executar a automacao sera necessario baixar algumas dependencias.
segue os passos:

## Downloads e configuracao de ambiente ruby

No terminal execute os seguintes comandos:
brew install ruby 2.7.5
brew install rbenv
rbenv install 2.7.5
rbenv global 2.7.5
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

## Configurando variaveis de ambiente da gem

No terminal execute os seguintes comandos:
nano ~/.bash_profile
realizar os export dentro do arquivo
export GEM_HOME=$HOME/.gem/ruby/2.7.5
export PATH=$GEM_HOME/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.5/bin:$PATH"

Ctrl+x depois Y depois ENTER para salvar
depois mandar source ~/.bash_profile para carregar as variaveis


## BAIXANDO DEPENDENCIAS DO PROJETO PARA QUE SEJA POSSIVEL EXECUTA-LO

Na raiz do seu projeto execute os seguintes comandos:

1- gem install bundler
2- bundle install

## EXECUTANDO O PROJETO
para executar o projeto execute na raiz do mesmo o seguinte comando:
bundle exec cucumber features/specs/pix_payment.feature
substitua nomedafeature.feature de acordo com o arquivo que deseja validar

obs: As evidencias com a execucao estarao na pasta report/allure-results