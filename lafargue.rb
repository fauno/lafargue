# encoding: utf-8
# Paul Lafargue (Santiago de Cuba, 15 de enero de 1842 - Draveil, 26 de
# noviembre de 1911) fue un periodista, médico, teórico político y
# revolucionario francocubano. Aunque en un principio su actividad
# política se orientó a partir de la obra de Proudhon, el contacto con
# Karl Marx (del que llegó a ser yerno al casarse con su segunda hija,
# Laura) acabó siendo determinante. Su obra más conocida es El Derecho a
# la Pereza.  http://es.wikipedia.org/wiki/Paul_Lafargue
require 'cinch'
require 'zmqmachine'

# Ideas:
# Especificar distintas redes IRC y canales a los que el Bot se conecta.
# Cuando alguien habla en uno de los canales, el Bot repite lo que se
# dice en los demás, manteniéndolos conectados.
#
# Como Cinch no soporta varias redes, la solución sería levantar varias
# instancias del mismo Bot en distintas redes y establecer IPC entre
# ellos para que repitan.  Como tengo ganas de probar ZeroMQ, la idea
# sería levantar un socket y que todas las instancias escriban y lean de
# ahí.

