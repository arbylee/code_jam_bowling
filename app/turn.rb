class Turn
  attr_reader :throw1,:throw2, :total

  def initialize(throw1, throw2)
    @throw1 = throw1
    @throw2 = throw2
    @total = @throw1 + @throw2
  end

  def strike?
    return @throw1 == 10
  end

  def spare?
    return @throw1 != 10 && @throw1 + @throw2 == 10
  end
end