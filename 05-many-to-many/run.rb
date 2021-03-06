require_relative "./user.rb"
require_relative "./tweet.rb"
require_relative "./like.rb"
require 'pry'

coffee_dad = User.new("Coffee Dad")
tea_uncle = User.new("Tea Uncle")

puts coffee_dad.username == "Coffee Dad"

tweet1 = Tweet.new("Coffee is great", coffee_dad)
tweet2 = Tweet.new("I need coffee", coffee_dad)
tweet3 = Tweet.new("Life is a meaningless void", coffee_dad)
tweet4 = Tweet.new("Drinkign some tea", tea_uncle)
tweet5 = Tweet.new("Life is bliss", tea_uncle)

puts tweet1.user == coffee_dad
puts tweet1.username == tweet1.user.username
puts tweet1.message == "Coffee is great"

puts Tweet.all == [tweet1, tweet2, tweet3, tweet4, tweet5]

puts coffee_dad.tweets == [tweet1, tweet2, tweet3]

tweet6 = coffee_dad.post_tweet("Need some more coffee")

puts coffee_dad.tweets == [tweet1, tweet2, tweet3, tweet6]

tea_uncle.like_tweet(tweet1)
tea_uncle.like_tweet(tweet2)
coffee_dad.like_tweet(tweet4)
puts tea_uncle.liked_tweets == [tweet1, tweet2]

puts tweet2.likers == [tea_uncle]

tea_uncle.like_tweet(tweet4)
puts !tweet4.likers.include?(tea_uncle)

# binding.pry

"hi"