# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  name                   :string
#  firstname              :string
#  lastname               :string
#  address                :string
#  phone                  :integer
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_uniqueness_of :name, :case_sensitive => false
  validates_uniqueness_of :email, :case_sensitive => false
  # validates_uniqueness_of :address, :case_sensitive =>false
  # validates_uniqueness_of :phone, :case_sensitive => false

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  has_many :identities
  has_many :recipes
  has_many :short_lists, dependent: :destroy
  acts_as_voter

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end


 def google_oauth2
    identities.where( :provider => "google_oauth2" ).first
 end

  def google_oauth2_client
    if !@google_oauth2_client
      @google_oauth2_client = Google::APIClient.new(:application_name => 'foodsharing', :application_version => "1.0.0" )
      @google_oauth2_client.authorization.update_token!({:access_token => google_oauth2.accesstoken, :refresh_token => google_oauth2.refreshtoken})
    end
    @google_oauth2_client
  end

  def get_image_avatar
    image = self.image_url
    if image.nil?
      'http://res.cloudinary.com/dgwgbnszx/image/upload/c_scale,w_50/v1479717237/userDefaultIcon_x1msy4.png'
    else
      if image.include? 'google'
        "#{image}?sz=50"
      elsif image.include? 'facebook'
        self.image_url
      end
    end
  end

  def get_profile_picture
    image = self.image_url
    if image.nil?
      # signup user
      'http://res.cloudinary.com/dgwgbnszx/image/upload/c_scale,w_200/v1479717237/userDefaultIcon_x1msy4.png'
    elsif image.include? 'google'
      # google avatar
      "#{image}?sz=200"
    elsif image.include? 'facebook'
      # facebook avatar
      "#{image}?width=200&height=200"
    end
  end
end



