express = require 'express'
utility = require 'utility'
superagent = require 'superagent'
cheerio = require 'cheerio'
url = require 'url'
moment = require 'moment'

tiebaUrl = 'http://tieba.baidu.com/'

app = express()

start = () ->
  app.get '/', (req, res, next) ->
    if req.url == '/favicon.ico'
      res.end 'favicon'

    superagent.get('http://tieba.baidu.com/f?kw=node&fr=ala0&tpl=5')
      .end (err, sres) ->
        if err
          next err
        $ = cheerio.load sres.text
        items = []
        topicUrl = []
        href = ''
        $('#thread_list .j_th_tit').each (idx , element) ->
          $element = $ element
          items.push
            title: $element.attr 'title'
            href: $element.attr 'href'

          if (typeof ($element.attr 'href')) is 'string'
            href = url.resolve(tiebaUrl, $element.attr 'href')
            topicUrl.push href
          else
            return true

#        console.log topicUrl
        time = -moment(1442890030 * 1000).local('zh-cn').diff(new Date(), 'days')
        console.log 'time is :::',time

#        date = new date()
#        console.log 'date is :::',date

        res.send items

  app.listen 5678, (req, res) ->
    console.log 'server is running at port 5678'

exports.start = start