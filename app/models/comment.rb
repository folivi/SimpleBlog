class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :content, presence: :true
  scope :approved, ->{ where(approved: true) }

  default_scope ->{ order('created_at desc')} #par defaut du plus récent au plus ancien

  def toggle_approval
  	 self.approved = !self.approved
  	self.save
  end
  
  def publication_date
    self.created_at.to_formatted_s(:long_ordinal)
  end
  
end
