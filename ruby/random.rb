def newMethod()
  html = "<!DOCTYPE html>\n  <html>\n  <head>\n    <title></title>\n  </head>\n  <body>\n\n  </body>\n</html>"
  return html
end

def tableMaker(array)

  table = "<table>\n"
  for item in array
    table += "  <tr><td>#{item}</td></tr>\n"
  end
  table += "</table>"
  
  return table
end

puts tableMaker([1,2,3,4,5])