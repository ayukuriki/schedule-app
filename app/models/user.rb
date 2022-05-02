class User < ApplicationRecord
    def change
        create_table :users do |t|
          t.string :title
          t.date:start_date
          t.date:end_date
          t.boolean	:all_day
          t.datetime:update_at
          t.text:memo
        end
    end   
end
