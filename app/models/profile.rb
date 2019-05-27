class Profile < ApplicationRecord
  
  belongs_to :user
  mount_uploader :avatar, AvatarUploader 
  validates :full_name, presence: true, on: :update
  validates :address, presence: true, on: :update
  validate :avatar_size, on: :update

  private

  def avatar_size
      if avatar.size > 2.megabytes
        errors.add(:avatar, "Should be less than 2MB")
      end
    end
end
