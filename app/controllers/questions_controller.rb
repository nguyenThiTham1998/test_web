class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def edit
	end

	def question_params
		params.require(:question).permit(:content,  answers_attributes: [:id, :content, :true])
	end
end
