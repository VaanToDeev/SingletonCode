require 'singleton'

class Configuracao
  include Singleton

  attr_accessor :tema, :idioma, :tamanho_fonte

  def initialize
    
    @tema = 'claro'
    @idioma = 'português'
    @tamanho_fonte = 12
  end
end

config = Configuracao.instance

config.tema = 'escuro'
config.idioma = 'inglês'
config.tamanho_fonte = 16

puts "Tema: #{config.tema}"
puts "Idioma: #{config.idioma}"
puts "Tamanho da fonte: #{config.tamanho_fonte}"
