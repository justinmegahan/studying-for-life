class CardsController < ApplicationController
	
	def index
		@cards = Card.all
	end

	def new
		@card = Card.new
	end

	def edit
		@card = Card.find(params[:id])
	end

	def update
		@card = Card.find(params[:id])
		if @card.update(card_params)
			flash[:notice] = "Card updated"
			redirect_to card_path(@card)
		else
			render :new
		end
	end

	def create
		@card = Card.new(card_params)
		if @card.save
			flash[:notice] = "Card created"
			redirect_to card_path(@card)
		else
			render :new
		end
	end

	def show
		@card = Card.find(params[:id])
	end

	def destroy
		@card = Card.find(params[:id])
		@card.destroy
		flash[:notice] = "Article deleted"
		redirect_to cards_path
	end

	private
	def card_params
		params.require(:card).permit(:question, :answer, :notes)
	end
end