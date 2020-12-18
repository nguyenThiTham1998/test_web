class ExamsController < ApplicationController
  before_action :find_exam, only: [:show, :new]

  def new
  	@exam = Exam.new
  	@detail_exam = DetailExam.new
    @subject = Subject.find_by(id: params[:subject_id])
    @questions = @subject.questions
    if user_signed_in?
      @profile = current_user.profile
    end
  end

  def create 
    @exam = Exam.new(exam_params)
    if @exam.save!
      redirect_to @exam
    else
      redirect_to new_exam_path(subject_id: params[:exam][:subject_id].to_i)
    end

  end

  def edit
  end

  def show
    @subject = Subject.find_by(id: @exam.subject_id)
    @questions = @subject.questions
    @answers = @exam.answers
    @answer_ids = @answers.pluck(:answer_id)

  end

  def destroy
  end

  private

  def exam_params
		params.require(:exam).permit( :user_id, :subject_id, :checked, :examee_name,
                                  :examee_date_of_birth, 
                                  :examee_more_detail, detail_exams_attributes: 
                                  [:answer_id])
  end

  def find_exam
    @exam = Exam.find_by(id: params[:id])
  end
end