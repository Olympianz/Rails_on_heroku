class Entry < ActiveRecord::Base
  has_many :addresses,  :dependent => :destroy
  has_many :emails,     :dependent => :destroy
  has_many :webs,       :dependent => :destroy
  has_many :phones,     :dependent => :destroy
  has_many :comments,   :dependent => :destroy

  accepts_nested_attributes_for :addresses,     :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :emails,        :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :webs,          :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :phones,        :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :comments,      :allow_destroy => true, :reject_if => :all_blank

  mount_uploader :avatar, AvatarUploader

  attr_accessible :first_name, :last_name, :title, :addresses_attributes, :emails_attributes, :webs_attributes, :phones_attributes, :comments_attributes, :avatar, :avatar_cache
  # attr_nested_attributes_for :addresses, allow_destroy:true, reject_if :all_black
  # validates_presence_of [:email, :first, :last_name]
  # validate_email_format_of :email  


def first_name=(val)
   write_attribute(:first_name, val.titleize)
end

def last_name=(val)
    write_attribute(:last_name, val.titleize)
end

def full_name
    first_name + ' ' + last_name
end

end
