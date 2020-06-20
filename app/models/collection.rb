class Collection < ActiveRecord::Base
    belongs_to :user

    validate
end