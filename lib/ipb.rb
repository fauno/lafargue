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
    # Por cada red
    $networks.each do |n|
      # Excepto en la presente
      next if n[:server] == m.bot.config.server

      # Y en cada canal
      n[:bot].channels.each do |c|
        # Repetir lo que dijeron
        c.send "#{m.user}: \"#{m.message}\""
      end
    end
  end

  # Lo mismo que en :message
  def action(m)
    $networks.each do |n|
      next if n[:server] == m.bot.config.server

      n[:bot].channels.each do |c|
        c.send "* #{m.user} #{m.message}"
      end
    end
  end

end
