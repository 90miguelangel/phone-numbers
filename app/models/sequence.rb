class Sequence < ApplicationRecord
  FROM = 1111111111
  TO = 9999999999

  def self.get_next
    if Sequence.any?
      next_val = Sequence.first.last + 1
      Sequence.first.update(last: next_val)
      return next_val
    else
      Sequence.create(last: FROM)
      return FROM
    end
  end
end
