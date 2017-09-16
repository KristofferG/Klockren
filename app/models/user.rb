class User < ApplicationRecord
  validates :firstName, presence: true,
                    length: { minimum: 2 }
  validates :lastName, presence: true,
                    length: { minimum: 1 }

end
