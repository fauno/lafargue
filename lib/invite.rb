# encoding: utf-8

# Acepta invitaciones a canales
class AcceptInvite
  include Cinch::Plugin

  listen_to :invite

  def listen(m)
    m.channel.join
    m.reply "o/"
  end
end
