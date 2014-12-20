class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, presence: :true
  validates :content, presence: :true
  has_and_belongs_to_many :tags
  
  mount_uploader :image, ArticleImageUploader
  
  scope :published, -> { where(draft: false) }
  scope :latest, ->{ order('created_at asc')}
  
  default_scope ->{ order('created_at desc')}
  def publication_date
    self.created_at.to_formatted_s(:long_ordinal)
  end
end
