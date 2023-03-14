require 'rspec'
require 'cucumber'
require 'httparty'
require 'faker'
require 'cpf_faker'
require 'json'
require "json_matchers/rspec"
require "allure-cucumber"
require 'base64'

# url do meu end point
URL = 'https://vagas.builders/api/builders'
# pegado os cookies.
COOKIE_FILE = "#{Dir.pwd}/features/support/headers/cookie.json"
$COOKIES = (JSON.parse(open(COOKIE_FILE).read))['cookies'].to_s

# adiciono um modulo pra configurar o httparty.
module Http
  include HTTParty
  base_uri URL
  format :json
  open_timeout 30
  follow_redirects false
  headers 'Content-Type' => 'application/json'
end

# Configurando o Json Schema.
$schema_directory = "#{Dir.pwd}/features/support/templates/pix_payment_qrcode.json"
# pego o camino do json e schema e chamo no meu teste o nome do arquivo.
JsonMatchers.schema_root = $schema_directory

