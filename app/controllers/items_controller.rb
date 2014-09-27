class ItemsController < ApplicationController
	expose(:item)

	expose(:incomplete_items) { Item.where("completed = ? OR completed IS NULL", false)}

	expose(:completed_items) { Item.where(completed: true)}
	
	def index 
	end

	def new
	end

	def create
		if @item.save
		redirect_to(items_path)

	    else 
	    	render :new
	    end
	end


	def complete
		item.completed = true
		item.completed_at = Time.now
		item.save

		redirect_to items_path
	end

	def destroy
		item.destroy
		redirect_to items_path
	end
end 