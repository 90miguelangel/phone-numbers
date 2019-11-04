class Phone < ApplicationRecord
  validates_presence_of :number
  validates :number, numericality: {
    greater_than_or_equal_to: Sequence::FROM,
    less_than_or_equal_to: Sequence::TO,
    only_integer: true
  }

  def self.request_number(requested_number=nil)
    if requested_number.present? && Phone.find_by(number: requested_number).nil?
      return Phone.create(number: requested_number)
    else
      return request_any_number
    end
  end

  private

  def self.request_any_number
    loop do
      @number = Sequence.get_next
      break if Phone.find_by(number: @number).nil?
    end
    allotted_num = Phone.create(number: @number)
    return allotted_num
  end

end
