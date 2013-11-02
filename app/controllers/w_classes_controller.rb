class WClassesController < ApplicationController

	def new
		@class = WClass.new
	end

	def create
		invalid = ['new', 'edit', 'create', 'update', 'destroy', 'index', 'show']
		@class = WClass.new(wclass_params)
		@class.class_type = params[:class_type] #rails why
		@class.school_id = School.find(params[:school_id]).id
		@class.slug = @class.name.parameterize+"-"+@class.instructor.downcase.parameterize+"-"+@class.class_type.downcase
		puts "WHAT IS THE SLUG #{@class.slug}"
		if invalid.include?(@class.slug)
			# warn
			render 'new'
		elsif WClass.find(@class.slug)
			puts "THIS IS THE CASE"
			redirect_to school_w_class_path(params[:school_id], @class.slug)
    elsif @class.save
    	@class.reports.build(votes_for: 0, votes_against: 0, comment: "").save
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
		@reports = @class.reports
		@school = School.find(@class.school_id)
	end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wclass_params
      params.require(:w_class).permit(:name, :instructor, :description, :class_type)
    end

end
