# Description:
#   Gets weather conditions from Netatmo Urban Weather Station.
#
# Dependencies:
#   "netatmo": "2.0.0"
#
# Configuration:
#   HUBOT_NETATMO_CLIENT_ID
#   HUBOT_NETATMO_CLIENT_SECRET
#   HUBOT_NETATMO_USERNAME
#   HUBOT_NETATMO_PASSWORD
#   HUBOT_NETATMO_DEVICE_ID
#
# Commands:
#   hubot wimbledon weather - Shows current weather conditions.
#
# Author:
#   ampledata
#


Netatmo = require('netatmo')


config =
  client_id: process.env.HUBOT_NETATMO_CLIENT_ID
  client_secret: process.env.HUBOT_NETATMO_CLIENT_SECRET
  username: process.env.HUBOT_NETATMO_USERNAME
  password: process.env.HUBOT_NETATMO_PASSWORD

options =
  device_id: process.env.HUBOT_NETATMO_DEVICE_ID # "70:ee:50:03:98:4c"
  module_id: process.env.HUBOT_NETATMO_OUTDOOR_MODULE_ID
  scale: "30min"
  type: [
    "Temperature"
    #"CO2"
    "Humidity"
    #"Pressure"
    #"Noise"
  ]


module.exports = (robot) ->
  netatmo_api = undefined
  
  robot.respond /(wimbledon indoor)/i, (msg) ->
  inOptions =
    device_id: process.env.HUBOT_NETATMO_DEVICE_ID
    module_id: process.env.HUBOT_NETATMO_DEVICE_ID
    scale: "30min"
    type: [
      "Temperature"
      "CO2"
      "Humidity"
      "Pressure"
      "Noise"
    ]
  
  unless netatmo_api
    netatmo_api = new Netatmo config
    
  netatmo_api.getMeasure inOptions, (err, measure) ->
    value = measure[..].pop()['value'][..].pop()
    return msg.send "Indoors right now in Wimbledon\nTemperature #{value[0]}°C\nHumidity #{value[2]}%\nCO2 #{value[1]}ppm\nPressure #{value[3]} mbar\nNoise #{value[4]} dB"

  robot.respond /(wimbledon weather)/i, (msg) ->
  unless config.client_id
    msg.send "Please set the HUBOT_NETATMO_CLIENT_ID environment variable."
    return
  unless config.client_secret
    msg.send "Please set the HUBOT_NETATMO_CLIENT_SECRET environment variable."
    return
  unless config.username
    msg.send "Please set the HUBOT_NETATMO_USERNAME environment variable."
    return
  unless config.password
    msg.send "Please set the HUBOT_NETATMO_PASSWORD environment variable."
    return
  unless options.device_id
    msg.send "Please set the HUBOT_NETATMO_DEVICE_ID environment variable."
    return

  unless netatmo_api
    netatmo_api = new Netatmo config

  netatmo_api.getMeasure options, (err, measure) ->
    value = measure[..].pop()['value'][..].pop()
    return msg.send "Weather right now in Wimbledon\nTemperature #{value[0]}°C\nHumidity #{value[1]}%"
# Description:
#   Gets weather conditions from Netatmo Urban Weather Station.
#
# Dependencies:
#   "netatmo": "2.0.0"
#
# Configuration:
#   HUBOT_NETATMO_CLIENT_ID
#   HUBOT_NETATMO_CLIENT_SECRET
#   HUBOT_NETATMO_USERNAME
#   HUBOT_NETATMO_PASSWORD
#   HUBOT_NETATMO_DEVICE_ID
#
# Commands:
#   hubot wimbledon weather - Shows current weather conditions.
#
# Author:
#   ampledata
#


Netatmo = require('netatmo')


config =
  client_id: process.env.HUBOT_NETATMO_CLIENT_ID
  client_secret: process.env.HUBOT_NETATMO_CLIENT_SECRET
  username: process.env.HUBOT_NETATMO_USERNAME
  password: process.env.HUBOT_NETATMO_PASSWORD

options =
  device_id: process.env.HUBOT_NETATMO_DEVICE_ID # "70:ee:50:03:98:4c"
  module_id: process.env.HUBOT_NETATMO_OUTDOOR_MODULE_ID
  scale: "30min"
  type: [
    "Temperature"
    #"CO2"
    "Humidity"
    #"Pressure"
    #"Noise"
  ]


module.exports = (robot) ->
  netatmo_api = undefined
  
  robot.respond /(wimbledon indoor)/i, (msg) ->
  inOptions =
    device_id: process.env.HUBOT_NETATMO_DEVICE_ID
    module_id: process.env.HUBOT_NETATMO_DEVICE_ID
    scale: "30min"
    type: [
      "Temperature"
      "CO2"
      "Humidity"
      "Pressure"
      "Noise"
    ]
  
  unless netatmo_api
    netatmo_api = new Netatmo config
    
  netatmo_api.getMeasure inOptions, (err, measure) ->
    value = measure[..].pop()['value'][..].pop()
    return msg.send "Indoors right now in Wimbledon\nTemperature #{value[0]}°C\nHumidity #{value[2]}%\nCO2 #{value[1]}ppm\nPressure #{value[3]} mbar\nNoise #{value[4]} dB"

  robot.respond /(wimbledon weather)/i, (msg) ->
  unless config.client_id
    msg.send "Please set the HUBOT_NETATMO_CLIENT_ID environment variable."
    return
  unless config.client_secret
    msg.send "Please set the HUBOT_NETATMO_CLIENT_SECRET environment variable."
    return
  unless config.username
    msg.send "Please set the HUBOT_NETATMO_USERNAME environment variable."
    return
  unless config.password
    msg.send "Please set the HUBOT_NETATMO_PASSWORD environment variable."
    return
  unless options.device_id
    msg.send "Please set the HUBOT_NETATMO_DEVICE_ID environment variable."
    return

  unless netatmo_api
    netatmo_api = new Netatmo config

  netatmo_api.getMeasure options, (err, measure) ->
    value = measure[..].pop()['value'][..].pop()
    return msg.send "Weather right now in Wimbledon\nTemperature #{value[0]}°C\nHumidity #{value[1]}%"
