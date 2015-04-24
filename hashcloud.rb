require 'twitter'
require 'yaml'

class Hashcloud
  COMMON_WORDS = %w( rt the be to of and in that have it for not on with 
                    he has you do at this but his by from they we say her
                    she or an will my one all would there their what so
                    up out if about who get which go me when make can like
                    time no just him know take people into year your good
                    some could them see other than then now look only come
                    its over think also back after use two how our work
                    well way even new want because any these give day most
                    us is are has was its dont isnt first
                    )
  attr_reader :word_map

  def initialize
    creds = YAML.load_file("credentials.yml")
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = creds["CONSUMER_KEY"]
      config.consumer_secret = creds["CONSUMER_SECRET"]
      config.access_token = creds["ACCESS_TOKEN"]
      config.access_token_secret = creds["ACCESS_TOKEN_SECRET"]
    end
    @word_map = Hash.new(0)
  end

  def search(query, tweet_count, options={ lang: "en" })
    @query = query
    @client.search(query, options).take(tweet_count)
  end

  def analyze(search_results)
    search_results.each do |tweet|
      word_array = make_word_array(tweet.text)
      build_word_map(word_array)
    end
  end

  def make_word_array(tweet_string)
    word_array = tweet_string.split(' ')
    word_array = clean_up(word_array)
  end

  def clean_up(array_of_words)
    array_of_words.delete_if { |word| word.length == 1 }
    array_of_words.delete_if { |word| COMMON_WORDS.include? remove_bad_characters(word).downcase }
    array_of_words.delete_if { |word| word.downcase == @query.downcase }
    array_of_words.delete_if { |word| word[0] =~ /\#|\@/ }
    array_of_words.delete_if { |word| word =~ /https?:\/\// }
  end

  def build_word_map(array_of_words)
    array_of_words.each { |word| word_map[word.to_sym] += 1 }
  end

  def remove_bad_characters(word)
    word.gsub(/\.|\,|\"|\'/, '')
  end

  def printable_word_map
    Hash[word_map.sort_by{ |k,v| -v }.first(100)]
  end

end

puts "What hashtag would you like to analyze?"
hashtag = gets.chomp
tweet_client = Hashcloud.new
puts "How many tweets would you like to compile?"
tweet_count = gets.chomp.to_i
puts "Searching"
results = tweet_client.search(hashtag, tweet_count)
puts "Analyzing"
tweet_client.analyze(results)
puts tweet_client.printable_word_map.inspect
