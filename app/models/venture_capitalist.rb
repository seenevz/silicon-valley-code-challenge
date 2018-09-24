class VentureCapitalist
  attr_accessor :name, :tres_commas

  @@all = []

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |venture_capitalist|
      venture_capitalist.tres_commas
    end
  end

  def initialize(name, tres_commas)
    @name = name
    @tres_commas = tres_commas

    @@all << self
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def portfolio
    startups = funding_rounds.map do |funding_round|
      funding_round.startup
    end
    startups.uniq
  end

  def funding_rounds
    FundingRound.all.select do |funding_round|
      funding_round.venture_capitalist == self
    end
  end

  def biggest_investment
    sorted_funding_rounds = funding_rounds.sort_by do |funding_round|
      funding_round.investment
    end
    sorted_funding_rounds.last
  end

  def invested(domain)
    funding_rounds_for_domain = funding_rounds.select do |funding_round|
      funding_round.startup.domain == domain
    end
    investments = funding_rounds_for_domain.map do |funding_round|
      funding_round.investment
    end
    investments.reduce(:+)
  end
end
