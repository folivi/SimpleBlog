class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :content, presence: :true
  scope :approved, ->{ where(approved: true) }


  def toggle_approval
  	 self.approved = !self.approved
  	self.save
  end
end
