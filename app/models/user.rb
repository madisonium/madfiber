class User < ActiveRecord::Base
  devise :registerable, :authenticatable, :confirmable, :recoverable,
         :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation

  has_and_belongs_to_many :roles

  def has_role? role_name
    roles.map(&:name).include? role_name
  end

  def give_role! role_name
    roles << Role.find_by_name(role_name)
    save
  end

  def remove_role! role_name
    Role.find_by_name(role_name).tap do |role|
      roles.delete role
    end
  end
end
