class CardsController < ApplicationController
	before_action :set_card, only: [:edit, :update, :show, :destroy]

	def index
		@cards = Card.all
	end

	def new
		@card = Card.new
	end

	def edit
	end

	def update
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
	end

	def destroy
		@card.destroy
		flash[:notice] = "Article deleted"
		redirect_to cards_path
	end

	private
		def set_card
			@card = Card.find(params[:id])
		end

		def card_params
			params.require(:card).permit(:question, :answer, :notes)
		end
end