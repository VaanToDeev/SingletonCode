module ILog
  def registrar(msg)
    raise NotImplementedError
  end
end

class LogArquivo
  include ILog
  def registrar(msg)
    File.open("log.txt", "a") do |f|
      f.puts msg
    end
  end
end

class LogConsole
  include ILog
  def registrar(msg)
    puts msg
  end
end

class LogFactory
  def criar_log
    raise NotImplementedError
  end
end

class LogArquivoFactory < LogFactory
  def criar_log
    LogArquivo.new
  end
end

class LogConsoleFactory < LogFactory
  def criar_log
    LogConsole.new
  end
end

log_arquivo_factory = LogArquivoFactory.new
log_arquivo = log_arquivo_factory.criar_log
log_arquivo.registrar("Esta é uma mensagem de log em um arquivo")

log_console_factory = LogConsoleFactory.new
log_console = log_console_factory.criar_log
log_console.registrar("Esta é uma mensagem de log na tela")
