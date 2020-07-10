class Form::BasicCollection < Form::Base
  BASIC_COUNT = 6  # 同時にユーザーを作成する数
  attr_accessor :basics  # ここに作成したユーザーモデルが格納される

  def initialize(attributes = {})
  super attributes
  self.basics = BASIC_COUNT.times.map { Basic.new() } unless self.basics.present?
  end

  def basics_attributes=(attributes)
    self.basics = attributes.map { |_, v| Basic.new(v) }
  end

  def save
    Basic.transaction do
      self.basics.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end