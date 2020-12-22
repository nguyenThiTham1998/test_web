class StaticPagesController < ApplicationController
  def home
  	@categories = Category.all
  	if params[:category_id].present?
		@category = Category.find_by(id: params[:category_id]) 
		@class = params[:category_id] 	
		@sub_categories = @category.sub_categories
  		if params[:sub_category_id].present?
		  	@sub_category = SubCategory.find_by(id: params[:sub_category_id])
		  	@class2 = params[:sub_category_id]
		  	@subjects = @sub_category.subjects
		else
	  		@subjects = @category.subjects
	  	end
	else
  		@subjects = Subject.all
  	end
  end

  def help
  end
end
