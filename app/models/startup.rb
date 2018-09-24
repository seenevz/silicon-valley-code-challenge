class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def pivot(domain)
    @domain = domain
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    funding_rounds.length
  end

  def total_funds
    investments = funding_rounds.map do |funding_round|
      funding_round.investment
    end
    investments.reduce(:+)
  end

  def investors
    venture_capitalists = funding_rounds.map do |funding_round|
      funding_round.venture_capitalist
    end
    venture_capitalists.uniq
  end

  def big_investors
    investors.select do |investor|
      investor.tres_commas
    end
  end

  private

  def funding_rounds
    FundingRound.all.select do |funding_round|
      funding_round.startup == self
    end
  end
end
