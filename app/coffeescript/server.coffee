# When using http
#http = require 'http'
#onRequest = ''
#
#start = () ->
#  onRequest = (req, res) ->
#    console.log 'req received !'
#    if req.url == '/favicon.ico'
#      res.end 'favicon'
#
#    res.end 'Jahmilli'
#    console.log 'res is sent!'
#
#  http.createServer(onRequest).listen(8124)
#  console.log 'Server is start.'
#
#exports.start = start

# When using express
express = require 'express'
utility = require 'utility'

app = express()

start = () ->
  app.get '/', (req, res) ->
    # get req parms q
    q = req.query.q
    md5Value = utility.md5 q
    res.send md5Value

  app.listen 5678, (req, res) ->
    console.log 'server is running at port 5678'

exports.start = start