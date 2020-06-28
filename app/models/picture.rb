class Picture < ApplicationRecord
    belongs_to :user
    attachment :image

end
