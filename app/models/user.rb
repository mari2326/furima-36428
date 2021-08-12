class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validetes :nickname, presence: true
  validetes :last_name, presence: true
  validetes :first_name, presence: true
  validetes :last_name_kana, presence: true
  validetes :first_name_kana, presence: true
  validetes :birthday, presence: true

end
