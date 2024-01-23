require 'json'
require 'net/http'

def fetch_todo(index)
  uri = URI("https://jsonplaceholder.typicode.com/todos/#{index}")
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

def print_todo(todo)
  puts "Title: #{todo['title']}"
  puts "Completed: #{todo['completed'] ? 'Yes' : 'No'}"
  puts "----------------------"
end

def main
  puts "Fetching the first 20 even-numbered TODOs..."
  puts "-------------------------------------------"

  (2..40).step(2).take(20).each do |index|
    todo = fetch_todo(index)
    print_todo(todo)
  end
end

main

