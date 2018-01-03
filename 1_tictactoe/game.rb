def initialize_empty_board
	$board_of_x_and_o = Array.new(3){Array.new(3, " ")}

	$name_of_cell_to_index = {"a"=>0, "b"=>1, "c"=>2, "1"=>2, "2"=>1, "3"=>0}

	$sign = "x"
end

def print_name_of_cells

	puts "-------------"
	puts "|a3 |b3 |c3 |"
	puts "-------------"
	puts "|a2 |b2 |c2 |"
	puts "-------------"
	puts "|a1 |b1 |c1 |"
	puts "-------------"

end

def print_board
	
	(0..2).each do |index_y|
		puts "-------------"
		(0..2).each do |index_x|
			print "| #{$board_of_x_and_o[index_x][index_y]} "
		end
		puts "|"
	end
	puts "-------------"
end

def chceck_winning_condition
	(0..2).each do |index_x|
		if $board_of_x_and_o[index_x][0] == $board_of_x_and_o[index_x][1] && 
			$board_of_x_and_o[index_x][1] == $board_of_x_and_o[index_x][2] &&
			$board_of_x_and_o[index_x][0] != " "
			puts "*************"
			puts "Wygraly #{$sign}!"
			puts "*************"
			exit
		end
	end

	(0..2).each do |index_y|
		if $board_of_x_and_o[0][index_y] == $board_of_x_and_o[1][index_y] && 
			$board_of_x_and_o[1][index_y] == $board_of_x_and_o[2][index_y] &&
			$board_of_x_and_o[0][index_y] != " "
			puts "*************"
			puts "Wygraly #{$sign}!"
			puts "*************"
			exit
		end
	end
 	
 	if $board_of_x_and_o[0][0] == $board_of_x_and_o[1][1] && 
		$board_of_x_and_o[1][1] == $board_of_x_and_o[2][2] &&
		$board_of_x_and_o[0][0] != " "
		puts "*************"
		puts "Wygraly #{$sign}!"
		puts "*************"
		exit
	end

	if $board_of_x_and_o[0][2] == $board_of_x_and_o[1][1] && 
		$board_of_x_and_o[1][1] == $board_of_x_and_o[2][0] &&
		$board_of_x_and_o[0][2] != " "
		puts "*************"
		puts "Wygraly #{$sign}!"
		puts "*************"

		exit
	end
	
end

def add_new_sign
	index_x = $name_of_cell_to_index[$name_of_cell[0]]
	index_y = $name_of_cell_to_index[$name_of_cell[1]]

	if index_x == nil || index_y == nil
		puts "Pole o taj nazwie nie istnieje, podaj wlasciwa nazwe!"
		get_player_move
	elsif $board_of_x_and_o[index_x][index_y] != " "
		puts "To pole jest już zajete. Wybierz inne!"
		get_player_move
	else
		$board_of_x_and_o[index_x][index_y] = $sign
	end
end

def get_player_move

	print "Podaj, w ktorym polu chcesz wstawic #{$sign}: "
	$name_of_cell = gets

	$name_of_cell.downcase!

	add_new_sign
end

def change_sign

	if $sign == "o"
		$sign = "x"
	else
		$sign = "o"
	end
end


initialize_empty_board
print_name_of_cells
print_board

(0..8).each do
	get_player_move
	print_board
	chceck_winning_condition
	change_sign
end

puts "*************"
puts "Remis!"
puts "*************"
exit
