class ContactMethod
  include Mongoid::Document
  include Mongoid::Timestamps
  include CreatedAndUpdatedBy

  # Subclass constants
  # TODO - abstract elsewhere
  EMAIL   = 'email'
  PHONE   = 'phone'
  ADDRESS = 'address'

  # Callbacks
  after_save :update_share_profiles

  # Attributes
  field :label, type: String
  field :pref,  type: Boolean, default: false

  # Relations
  belongs_to :user, class_name: 'User'
  has_and_belongs_to_many :share_profiles, class_name: 'ShareProfile', inverse_of: nil

  # Validations
  validates :label,  presence: true

  def update_share_profiles
    puts 'update share profiles here'
    puts self.share_profile_ids
    return
  end

end
