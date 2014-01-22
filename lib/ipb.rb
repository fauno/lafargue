# encoding: utf-8
# Comunicación entre instancias del Bot!

class IPB
  include Cinch::Plugin

  # Escuchar mensajes privados y en canales
  listen_to :message, method: :message
  # Escuchar acciones /me
  listen_to :action, method: :action

  # Cuando llega un mensaje a un canal
  def message(m)

    return if m.action?

    # Si estamos preguntando por los canales devolver una lista y dejar
    # de procesar
    if not m.message.match(/\/list/).nil?
      $networks.each do |n|
        m.reply "#{n[:server]} => #{n[:bot].channels.map { |c| c.name }.to_s.gsub(/["\[\]]/, '') }"
      end

      return
    end

    # Devuelve la lista de nicks de cada canal y red
    if not m.message.match(/\/names/).nil?
      $networks.each do |n|
        n[:bot].channels.each do |c|
          puts c.users
          m.reply "#{n[:server]}/#{c.name} (#{c.users.count}): #{c.users.keys.map { |u| u.nick }.to_s.gsub(/["\[\]]/, '')}"
        end
      end
      return
    end

    # Por cada red
    $networks.each do |n|
      # Excepto en la presente
      next if n[:server] == m.bot.config.server

      # Y en cada canal
      n[:bot].channels.each do |c|
        # Repetir lo que dijeron
        c.send "#{m.user}: #{m.message}"
      end
    end
  end

  # Lo mismo que en :message
  def action(m)
    $networks.each do |n|
      next if n[:server] == m.bot.config.server

      n[:bot].channels.each do |c|
        c.send "* #{m.user} #{m.message.gsub(/ACTION /, '')}"
      end
    end
  end

end
