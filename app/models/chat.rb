class Chat < ActiveRecord::Base
  has_many :user_chats, :dependent => :destroy
  has_many :users, :through => :user_chats
  has_many :parted_users, :through => :user_chats, :conditions => "user_chats.parted_at is not null", :source => :user
  has_many :messages, :dependent => :destroy

  accepts_nested_attributes_for :messages

  validates_presence_of :subject

  def part_by user
    if uc = user_chats.where(:user_id => user.id).first
      uc.touch(:parted_at)
    end
  end

  def unread_count
    read_attribute(:unread_count).to_i
  end

  # OPTIMIZE
  def read_by user
    if uc = user_chats.where(:user_id => user.id).first
      uc.read_count = messages_count
      uc.save
    end
  end
end
