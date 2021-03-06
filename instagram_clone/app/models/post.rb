class Post < ApplicationRecord
  validates :title, length: { minimum: 3 }, uniqueness: true
  validates :image, presence: true
  belongs_to :user

  has_and_belongs_to_many :tags
  has_many :likes
  has_many :comments,
          -> { extending WithUserAssociationExtension }, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
