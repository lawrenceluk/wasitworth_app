class School < ActiveRecord::Base

	has_many :w_classes, dependent: :destroy

	validates :name, presence: true, length: { minimum: 2, maximum: 80 }
  validates :hiddenname, presence: true,
  	uniqueness: { case_sensitive: false, 
  		message: "error: That school already exists." }

  def self.find(input)
    if input && input.to_i == 0 
      find_by_hiddenname(input.downcase)
    else 
      super
    end
  end

end
