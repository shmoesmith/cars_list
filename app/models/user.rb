class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #associations
  has_many :cars, dependent: :destroy
  
  #validations
  #callbacks
  #instance methods
  #class methods

end
