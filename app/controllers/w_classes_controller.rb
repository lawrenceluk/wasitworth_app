class WClassesController < ApplicationController

	def new
		@class = WClass.new
	end

	def create
		@class = WClass.new(wclass_params)
		@class.class_type = params[:class_type] #rails why
		@class.school_id = School.find(params[:school_id]).id
		@class.slug = @class.name.parameterize
		if WClass.find(@class.slug)
			# warn
			render 'new'
    elsif @class.save
    	puts "Great success"
      redirect_to school_w_class_path(params[:school_id], @class.slug)
    else
      render 'new'
    end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def index
	end

	def show
		@class = WClass.find(params[:id])
		@school = School.find(@class.school_id)
	end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wclass_params
      params.require(:w_class).permit(:name, :instructor, :description, :class_type)
    end

end
