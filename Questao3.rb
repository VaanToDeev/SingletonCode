module IBotao
  def clicar
    raise NotImplementedError
  end
end

module IJanela
  def abrir
    raise NotImplementedError
  end
end

module ICursor
  def mover
    raise NotImplementedError
  end
end

module ISelect
  def selecionar
    raise NotImplementedError
  end
end

module IInput
  def digitar
    raise NotImplementedError
  end
end

class BotaoWindows
  include IBotao
  def clicar
    puts "Clicou em um botão no Windows"
  end
end

class BotaoMacOS
  include IBotao
  def clicar
    puts "Clicou em um botão no macOS"
  end
end

class JanelaWindows
  include IJanela
  def abrir
    puts "Abriu uma janela no Windows"
  end
end

class JanelaMacOS
  include IJanela
  def abrir
    puts "Abriu uma janela no macOS"
  end
end

class CursorWindows
  include ICursor
  def mover
    puts "Moveu o cursor no Windows"
  end
end

class CursorMacOS
  include ICursor
  def mover
    puts "Moveu o cursor no macOS"
  end
end

class SelectWindows
  include ISelect
  def selecionar
    puts "Selecionou uma opção em um select no Windows"
  end
end

class SelectMacOS
  include ISelect
  def selecionar
    puts "Selecionou uma opção em um select no macOS"
  end
end

class InputWindows
  include IInput
  def digitar
    puts "Digitou em um input no Windows"
  end
end

class InputMacOS
  include IInput
  def digitar
    puts "Digitou em um input no macOS"
  end
end

module IFabrica
  def criar_botao
    raise NotImplementedError
  end

  def criar_janela
    raise NotImplementedError
  end

  def criar_cursor
    raise NotImplementedError
  end

  def criar_select
    raise NotImplementedError
  end

  def criar_input
    raise NotImplementedError
  end
end

class FabricaWindows
  include IFabrica
  def criar_botao
    BotaoWindows.new
  end

  def criar_janela
    JanelaWindows.new
  end

  def criar_cursor
    CursorWindows.new
  end

  def criar_select
    SelectWindows.new
  end

  def criar_input
    InputWindows.new
  end
end

class FabricaMacOS
  include IFabrica
  def criar_botao
    BotaoMacOS.new
  end

  def criar_janela
    JanelaMacOS.new
  end

  def criar_cursor
    CursorMacOS.new
  end

  def criar_select
    SelectMacOS.new
  end

  def criar_input
    InputMacOS.new
  end
end

fabrica_windows = FabricaWindows.new
botao_windows = fabrica_windows.criar_botao
janela_windows = fabrica_windows.criar_janela
cursor_windows = fabrica_windows.criar_cursor
select_windows = fabrica_windows.criar_select
input_windows = fabrica_windows.criar_input
botao_windows.clicar
janela_windows.abrir
cursor_windows.mover
select_windows.selecionar
input_windows.digitar

fabrica_macos = FabricaMacOS.new
botao_macos = fabrica_macos.criar_botao
janela_macos = fabrica_macos.criar_janela
cursor_macos = fabrica_macos.criar_cursor
select_macos = fabrica_macos.criar_select
input_macos = fabrica_macos.criar_input
botao_macos.clicar
janela_macos.abrir
cursor_macos.mover
select_macos.selecionar
input_macos.digitar
