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
end
