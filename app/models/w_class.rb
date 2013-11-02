class WClass < ActiveRecord::Base

	has_many :reports

	before_create :generate_slug

	belongs_to :school
	default_scope -> { order('created_at DESC') }

	validates :name, length: { minimum: 2, maximum: 80 }
	validates :class_type, presence: true
	validates :instructor, length: { minimum: 2, maximum: 80 }

  def generate_slug
    self.slug = name.parameterize+"-"+instructor.downcase.parameterize+"-"+class_type.downcase
  end

  def to_param
    slug
  end

  def self.find(input)
    if input && input.to_i == 0 
      find_by_slug(input)
    else       
    	super
    end
  end

end
