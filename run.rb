#Vincent Gijsen (http://www.vincentgijsen.nl)
#
# 2012-07-25
# Please note, apple can ask you to verify your actually attending such institute



require 'open-uri'
require 'Nokogiri'

i= 120000
max = 200000

File.open('result.csv', 'w'){|f|

begin
        sleep(1)
        print ".#{i}"
        #u = "http://store.apple.com/nl_edu_#{i}/browse/home/shop_mac/family/macbook_air/select"
        u = "http://store.apple.com/nl_aoc_#{i}/browse/home/shop_mac/family/macbook_air/select"
        i = i + 1
        doc = Nokogiri::HTML(open(u))
        #als we geen exceptie hebben:
        print "url: #{u} ;"
        xpathExpr = '//div[@id="product-selection-2"]//li[@class="price"]'
        doc.encoding = 'utf-8'
        res= doc.xpath(xpathExpr)[0].text.strip.split(" ")[1]
        print "#{res}\n"
        f.write("#{u};#{res}\n")
        rescue
        #do nothing

end while (i < max)
}
