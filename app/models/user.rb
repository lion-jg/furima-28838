class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :password_confirmation, :birth ,presence: true

  validates :password,  length: { minimum: 6 }, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '' 

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '' } do
    validates :family_name_furigana
    validates :first_name_furigana
  end
end
