class Report < ActiveRecord::Base
	belongs_to :w_class

	default_scope -> { order('created_at DESC') }

end
