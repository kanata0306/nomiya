class BusinessHour < ApplicationRecord
  belongs_to :post
  
  enum week_day: { sun: 0, mon: 1, tue: 2, wed: 3, thu: 4, fri: 5, sat: 6 }
end
