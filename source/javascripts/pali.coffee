//= require 'l1'
//= require 'l2'

# https://github.com/janl/mustache.js/blob/master/mustache.js#L49

entityMap =
  "&": "&amp;"
  "<": "&lt;"
  ">": "&gt;"
  '"': '&quot;'
  "'": '&#39;'
  "/": '&#x2F;'

escapeHtml = (string) ->
  String(string).replace /[&<>"'\/]/g, (s) -> entityMap[s]

$('p.p').each (_, li) ->
  li = $(li)
  html = li.html().split(/\s+/)
  result = []
  for word, i in html
    key = word.replace(/[,.;?…\s]/g, '').toLowerCase()
    trans = window.paliDict[key]
    if trans
      result.push "<span class=\"p\" title=\"#{escapeHtml(trans)}\">#{word}</span>"
    else
      result.push "<span class=\"error\">#{word}</span>"
  li.html(result.join(' '))
