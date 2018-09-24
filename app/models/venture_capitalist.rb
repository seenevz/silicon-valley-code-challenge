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
end
