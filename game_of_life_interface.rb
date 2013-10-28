require './lib/grid'
require './lib/cell'

def init
  @grid = Grid.new(10, 10)
end

def main_menu
  border = "OO"
  @grid.universe.length.times {border << "OOO"}
  puts "\n"
  puts border

  @grid.universe.each do |row|
    cells = "O"
    row.each { |cell| cell.is_alive ? cells << " X " : cells << "   " }
    puts cells + "O"
  end

  puts border
  puts "\n"

  puts "Enter 's' to start animation, 'a' to add a living cell or 'x' to exit"
  selection = gets.chomp

  if selection == "s"
    puts `clear`
    # start_animation  NEED TO FIX
  elsif selection == "a"
    puts "\n"
    add_cell
  elsif selection == "x"
    puts "Now to take over the world!"
    puts "\n"
  else
    puts "Please select a valid option"
    puts "\n"
    main_menu
  end
end

# $flag = false

# t = Thread.new() {
#   loop do
#     $flag = gets
#     break if $flag
#   end
# }

# def start_animation
#   loop do
#     break if $flag
#     @grid.next_generation

#     border = "OO"
#     @grid.universe.length.times {border << "OOO"}
#     puts "\n"
#     puts border

#     @grid.universe.each do |row|
#       cells = "O"
#       row.each { |cell| cell.is_alive ? cells << " X " : cells << "   " }
#       puts cells + "O"
#     end

#     puts border

#     puts `clear`
#   end
# end

def add_cell
  puts "Please enter the x-coordinate for a cell to infuse with life"
  puts "Coordinates start at [0, 0] in the upper lefthand corner"
  x_coord = gets.chomp.to_i
  puts "Please enter the y-coordinate for a cell to infuse with life"
  puts "Coordinates start at [0, 0] in the upper lefthand corner"
  y_coord = gets.chomp.to_i
  @grid.universe[x_coord][y_coord].is_alive = true
  puts "\n"
  puts "You have generated life at [#{x_coord}, #{y_coord}]." 
  puts "Press [Enter] to add another living cell or 'm' to return to the main menu"
  selection = gets.chomp
  if selection == ""
    puts "\n"
    add_cell
  elsif selection == "m"
    puts "\n"
    main_menu
  else
    puts "Please enter a valid option"
    puts "\n"
    add_cell
  end
end

init
main_menu