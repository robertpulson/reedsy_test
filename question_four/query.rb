require 'net/http'
require 'json'

class Query

  attr_reader :success, :error

  def initialize(input)
    @query = input
    get_results
  end

  def get_results
    uri = URI('https://www.googleapis.com/books/v1/volumes')
    params = { q: @query }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    @success = true if res.is_a?(Net::HTTPSuccess)
    @results = JSON.parse(res.body)
  rescue SocketError => e
    @success = false
    @error = e
  end

  def output
    return "No results found for '#{@query}'" unless @results['items']
    o = @results['items'].each_with_index.map { |b, i| "#{i + 1}: #{b['volumeInfo']['title']}" }
    o.unshift("Books for '#{@query}':")
  end
end
