class Player
  attr_accessor :name, :score, :board

  def initializer(name)
    @name = name
    @score = 0
  end
end
