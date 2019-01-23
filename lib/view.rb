class View

	def create_gossip
		puts "Quel est ton nom, commère ?"
		enter_name = gets.chomp
		puts "Vas-y ! Déballe tout ! Qu'as-tu à nous dire ?"
		enter_gossip = gets.chomp
		return params = { content: enter_gossip, author: enter_name }
	end

	def index_gossips(gossips)
		gossips.each do |potin|
			puts "#{potin.author} : #{potin.content}"
		end
	end

	def delete_gossip
		puts "Tu veux supprimer le potins de quelle commère ?"
		snitch_name = gets.chomp
		return snitch_name
	end

end