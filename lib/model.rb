class Gossip
	attr_reader :content, :author

	def save
		headers = ["Author", "Content"]

		CSV.open("db/gossip.csv", "a+") do |csv|
			csv << headers if csv.count.eql? 0
			csv << [@author, @content]
		end
	end


	def initialize(author, content)
		@content = content
	  @author = author
	end

	def self.all
		all_gossips =[]
		CSV.foreach("db/gossip.csv") do |ligne|
			gossip_provisoire = Gossip.new(author = ligne[0], content = ligne[1])
			all_gossips << gossip_provisoire
		end
		return all_gossips
	end

	def self.delete(snitch)
		table = CSV.table("db/gossip.csv")
		table.delete_if do |row|
			row[0] == snitch
		end
		File.open("db/gossip.csv", 'w') do |f|
			f.write(table.to_csv)
		end
end



end