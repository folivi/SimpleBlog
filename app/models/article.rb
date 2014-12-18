class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates :title, presence: :true
  validates :content, presence: :true
  has_and_belongs_to_many :tags
  
  mount_uploader :image, ArticleImageUploader
  
  scope :published, -> { where(draft: false) }
  scope :latest, ->{ order('created_at asc')}
end
