# sinatra.rb
require 'json'
require 'sinatra'
require './db_util.rb'

get '/helloworld' do
  'welcome'
end

get '/selectAll' do
  results = DbUtil.selectAll

  array = Array.new
  results.each do |row|
    array.push(row)
  end
  puts array

  return array.to_s
end

