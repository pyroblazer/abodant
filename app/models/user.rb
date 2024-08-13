class User < ApplicationRecord
  # Include default Devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google]

  has_one :company
  has_many :queries, dependent: :destroy

  validates :first_name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
  uniqueness: { case_sensitive: false }
  
  enum contact_method: { email: 0, text: 1, call: 2 }

  def self.from_omniauth(auth)
    user = find_by(provider: auth.provider, uid: auth.uid)

    if user
      user
    else
      registered_user = find_by(email: auth.info.email)

      if registered_user
        registered_user
      else
        create!(
          provider: auth.provider,
          email: auth.info.email,
          first_name: auth.info.email.split('@').first,
          uid: auth.uid,
          is_hunter: true,
          is_realtor: false,
          password: Devise.friendly_token[0, 20]
        )
      end
    end
  end
end
