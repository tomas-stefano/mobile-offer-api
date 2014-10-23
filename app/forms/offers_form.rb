class OffersForm
  include ActiveModel::Model

  attr_accessor :uid, :pub0, :page
  attr_writer :offers

  validates :uid, presence: true
  validates :uid, :pub0, length: { maximum: 50 }
  validates :page, numericality: true, length: { maximum: 15 }, allow_blank: true

  attr_reader :attributes

  def initialize(attributes = {})
    @attributes = (attributes || {}).slice(:uid, :pub0, :page)

    super(@attributes)
  end

  def has_user_data_and_valid?
    @attributes.present? && valid?
  end

  def attributes
    @attributes.select { |key,value| value.present? }
  end
end