class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  has_many :items

  validates :name, length: {minimum: 1}

  def delete_expired_items
    items.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
