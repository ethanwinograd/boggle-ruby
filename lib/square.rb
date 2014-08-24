class Square

  attr_accessor :char, :row, :col

  def initialize(row, col, char)
    @char=char
    @row=row
    @col=col
  end

  def to_s
    "#{@char} - row : #{@row} - col : #{col}"
  end

end
