class Order < ActiveRecord::Base #inherited from
    belongs_to :user
end