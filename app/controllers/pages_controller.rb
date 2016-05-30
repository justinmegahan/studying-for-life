class PagesController < ApplicationController
	def home
		randomCards = (1..1+Card.all.length).to_a.sort{ rand() - 0.5 }[0..9]
		@cards = [
			Card.find(randomCards[0]),
			Card.find(randomCards[1]),
			Card.find(randomCards[2]),
			Card.find(randomCards[3]),
			Card.find(randomCards[4]),
			Card.find(randomCards[5]),
			Card.find(randomCards[6]),
			Card.find(randomCards[7]),
			Card.find(randomCards[8]),
			Card.find(randomCards[9])]
	end
end