class Movie < ApplicationRecord
  default_scope {order(created_at: 'DESC')}
  validates :title, presence: true,
                    length: { minimum: 2 }
end
