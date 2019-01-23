require './lib/model'
require './lib/view'

class Controller

	def initialize
		@view = View.new
	end

	def create_gossip
		params = @view.create_gossip
		author = params.values[1]
		content = params.values[0]
		gossip = Gossip.new(author, content)
		gossip.save
		
	end

	def index_gossips
		all_gossips = Gossip.all
		@view.index_gossips(all_gossips)
	end

	def delete_gossip
		snitch_name = @view.delete_gossip
		Gossip.delete(snitch_name)
	end

end
