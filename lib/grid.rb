class Grid
  attr_accessor :universe

  def initialize(column, row)
    @universe = []
    column.times do |column|
      @universe[column] = []
      row.times do |row|
        @universe[column][row] = Cell.new
      end
    end    
  end

  def count_neighbors(column, row)
    number_of_neighbors = 0

    3.times do |column_increment|
      3.times do |row_increment|
        location = wrap_universe(column + column_increment - 1, row + row_increment - 1)
        number_of_neighbors += 1 if @universe[location[0]][location[1]].is_alive
      end
    end

    @universe[column][row].is_alive ? number_of_neighbors -= 1 : number_of_neighbors
  end

  def wrap_universe(column, row)
    if column == @universe.length 
      column = 0 
    elsif column < 0
      column = @universe.length - 1
    end

    if row == @universe[0].length
      row = 0
    elsif row < 0
      row = @universe[0].length - 1
    end  
    [column, row]
  end

  def next_generation
    @universe.length.times do |column|
      @universe[0].length.times do |row|
        @universe[column][row].number_of_neighbors = count_neighbors(column, row)
      end
    end

    @universe.length.times do |column|
      @universe[0].length.times do |row|
        @universe[column][row].determine_fate
      end
    end
  end
end    
