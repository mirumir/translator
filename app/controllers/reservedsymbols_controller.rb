class ReservedsymbolsController < ApplicationController
	def new
		Reservedsymbol.new
	end

	def show
		unless @reservedsymbol = Reservedsymbol.find(1)
			render "new"
		end
	end

	def edit
		@reservedsymbol = Reservedsymbol.where(id: 1).first
	end

	def update
		@reservedsymbol = Reservedsymbol.find(1)
		@reservedsymbol.update_attributes(reservedsymbol_params)
		if @reservedsymbol.errors.empty?
			redirect_to reservedsymbol_path(1)
		else 
			flash.now[:error] = "Поле не может быть пустым!"
			render "edit"
		end
	end

	private

		def reservedsymbol_params
			params.require(:reservedsymbol).permit(:symbols)
		end
end
