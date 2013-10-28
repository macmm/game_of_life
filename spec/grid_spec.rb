require 'rspec'
require 'grid'
require 'cell'

describe Grid do
  it 'initializes with an array of x by y dimensions (based on user input)' do
    grid = Grid.new(3, 3)
    grid.should be_an_instance_of Grid
  end

  describe 'count_neighbors' do
    it 'counts the number of neighbors each cell has' do
      grid = Grid.new(3, 3)
      grid.universe[0][2].is_alive = true
      grid.count_neighbors(1, 1).should eq 1
    end
  end

  describe 'wrap_universe' do
    it 'wraps the edges of the universe' do
      grid = Grid.new(3, 3)
      grid.wrap_universe(3, -1).should eq [0, 2]
    end
  end

  describe 'next_generation' do
    it 'creates the next generation of cells' do
      grid = Grid.new(3, 3)
      grid.universe[0][2].is_alive = true
      grid.universe[1][2].is_alive = true
      grid.universe[0][0].is_alive = true
      grid.next_generation
      grid.universe[1][1].is_alive.should be_true
    end
  end
end


