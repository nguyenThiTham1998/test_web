class SubjectsController < ApplicationController
	before_action :find_subject, only: [:show, :edit]

	def new
		@subject = Subject.new
	end

	def show
	end

	def create
		@subject = Subject.new(subject_params)
		if @subject.save
			redirect_to edit_subject_path(@subject)
		else
			render 'new'
		end
	end

	def edit 
		@questions = @subject.questions
	end

    private

    def subject_params
        params.require(:subject).permit(:name, :description, :time, :auto_check, :public,
        								:user_id, :category_id, :sub_category_id, :start_at,
        								:end_at, :password, :password_confirmation)  
    end

    def find_subject
        @subject = Subject.find_by(id: params[:id])
    end 
end

