class ReportsController < ApplicationController

	def create
		report = WClass.find(params[:report][:w_class_id]).reports.where("comment = ''")
		if report.count == 1
			r = Report.find(report.first.id)
			if params[:commit] == 'Worth'
				r.update_attribute(:votes_for, r.votes_for+1)
			elsif params[:commit] == 'Not Worth'
				r.update_attribute(:votes_against, r.votes_against+1)
			end
		end
		if report_params[:comment] != ""
			@report = WClass.find(report_params[:w_class_id]).reports.build(report_params)
			if params[:commit] == 'Worth'
				@report.votes_for = 1
				@report.votes_against = 0
			elsif params[:commit] == 'Not Worth'
				@report.votes_against = 1
				@report.votes_for = 0
			end
			@report.save
		end
		respond_to do |format|
			format.js
			format.html
		end
	end

  def report_params
    params.require(:report).permit(:comment, :w_class_id)
  end
end
