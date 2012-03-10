# -*- coding: utf-8 -*-
# Print the word which has been contained in tweets at togetter page, with rank order of frequency of use.
require 'igo-ruby'
require 'nokogiri'

tagger = Igo::Tagger.new(File.expand_path('../assets/ipadic', __FILE__)) # You should get MeCab dic and set up it.
doc = Nokogiri::HTML(open(ARGV[0]))
dic = Hash.new(0)

doc.xpath('//div[@class="tweet"]').each do |tweet|
  tagger.parse(tweet.text).each do |m|
    dic[m.surface] += 1
  end 
end

dic.sort do |a, b|
  b[1] <=> a[1]
end.each do |k, v|
  p "#{k}: #{v}"
end
