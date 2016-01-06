
WIN_COMBINATIONS=[
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # ETC, an array for each win combination
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
# Helper Method


# Helper Methods

def turn_count(board)
  count=0
  board.each do |position|
    if(position=="X"||position=="O")
      count+=1
    end
  end
    return count
end

def current_player(board)
  if(turn_count(board)%2==0)
    current_player = "X"
  else
    current_player = "O"
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input)
  else
    turn(board)
  end
  display_board(board)
end

# Define your play method below



def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def empty?(board)
  board.each do |position|
    if (position=="X"||position=="O")
      return false
    end
  end
end

def full?(board)
  return (draw?(board))
end

def draw?(board)
WIN_COMBINATIONS.each do |combination|
    if(board[combination[0]]=="X"&&board[combination[1]]=="X"&&board[combination[2]]=="X")
      return false
    elsif(board[combination[0]]=="O"&&board[combination[1]]=="O"&&board[combination[2]]=="O")
      return false
    end
  end
  board.each do |position|
    if (position == " "||position == ""||position==nil)
      return false
    end
  end
  return true
end


def over?(board)
  if(!(draw?(board))&&(!(won?(board))))
    return false
  else
    return draw?(board)||won?(board)
    end
end

def winner(board)
  if (!(won?(board)))
    return nil
  elsif (won?(board))
    return board[won?(board)[0]]
  end
end

def won?(board)

  if (empty?(board)||draw?(board))
    return false
  end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS.each do |combination|
    if(board[combination[0]]=="X"&&board[combination[1]]=="X"&&board[combination[2]]=="X")
      return combination
    elsif(board[combination[0]]=="O"&&board[combination[1]]=="O"&&board[combination[2]]=="O")
      return combination
    end
  end

end

def play(board)
  until over?(board)
      turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end