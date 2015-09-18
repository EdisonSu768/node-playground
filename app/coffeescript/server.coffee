http = require 'http'
onRequest = ''

start = () ->
  onRequest = (req, res) ->
    console.log 'req received !'
    if req.url == '/favicon.ico'
      res.end 'favicon'

    res.end 'Jahmiili'

  http.createServer(onRequest).listen(8124)
  console.log 'Server is start.'

exports.start = start