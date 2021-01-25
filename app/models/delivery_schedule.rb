class DeliverySchedule < ActiveHash::Base
  self.data = [
    { id: 1, delivery_schedule: '--' },
    { id: 2, delivery_schedule: '1~2日で発送' },
    { id: 3, delivery_schedule: '2~3日で発送' },
    { id: 4, delivery_schedule: '4~7日で発送' },
  ]

  include ActiveHash::Associations
    has_many :items

end