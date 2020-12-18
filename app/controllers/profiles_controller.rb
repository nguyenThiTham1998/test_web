class ProfilesController < ApplicationController
	before_action :find_profile, only: [:show, :edit]

  def edit
  end

  def show
  end

  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)
			if @profile.save
				redirect_to root_path
			else
				render 'new'
			end
  end

  private
    def profile_params
        params.require(:profile).permit(:name, :more_detail, :date_of_birth, 
        																:user_id, :organization)  
    end

    def find_profile
        @profile = Profile.find_by(id: params[:id])
    end 
end
