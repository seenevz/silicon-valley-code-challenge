require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Pied Piper", "Richard Hendricks", "decentralization")
s2 = Startup.new("Hooli", "Gavin Belson", "search")
s3 = Startup.new("Duck Duck Go", "Gabriel Weinberg", "search")
s4 = Startup.new("Meow Kind", "Michael Cheng", "cats")

v1 = VentureCapitalist.new("Laurie Bream", false)
v2 = VentureCapitalist.new("Russ Hanneman", true)
v3 = VentureCapitalist.new("Monica Hall", false)
v4 = VentureCapitalist.new("Peter Gregory", true)

fr1 = FundingRound.new(s1, v1, "Series A", 100)
fr2 = FundingRound.new(s1, v4, "Seed", 50)
fr3 = FundingRound.new(s3, v2, "Seed", 50)
fr4 = FundingRound.new(s3, v4, "Seed", 100)
fr5 = FundingRound.new(s4, v1, "Seed", 100)
fr6 = FundingRound.new(s4, v2, "Series A", 100)
fr7 = FundingRound.new(s4, v3, "Series B", 100)
fr8 = FundingRound.new(s4, v4, "Series C", 100)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
