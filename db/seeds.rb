require './db/seed_demo_group.rb'

# Protect against destroying Production
error_msg = "Database Seed not allowed in production"
raise StandardError, error_msg      if Rails.env.production?
raise StandardError, error_msg  unless Rails.env.development? || Rails.env.test?

Space.destroy_all
Event.destroy_all
Reservation.destroy_all

admin  = Admin.create(admins_name: "New Admin",
                      email: "admin@test.com",
                      password: "Let-M3-In-N0w!", password_confirmation:  "Let-M3-In-N0w!")
umdze  = Umdze.create(umdzes_name: "Edit Umdze",
                      email: "umdze@test.com",
                      password: "Let-M3-In-N0w!", password_confirmation:  "Let-M3-In-N0w!")
patron = Patron.create(# username: "view-patron",
                      email: "patron@test.com",
                      password: "Let-M3-In-N0w!", password_confirmation:  "Let-M3-In-N0w!")

spaces = []
spaces << FactoryBot.create(:space, space_name: "Center")
spaces << FactoryBot.create(:space, space_name: "Anex")

# events = []
# 5.times do
#   event   = FactoryBot.create :event
#   events << event
# end
events = 5.times.map { FactoryBot.create :event }

hour_am_start = Time.parse('09:30')
hour_am_end   = Time.parse('12:30')
hour_pm_start = Time.parse('13:30')
hour_pm_end   = Time.parse('17:30')
hour_ev_start = Time.parse('18:30')
hour_ev_end   = Time.parse('20:30')

(-4..4).each do |shift|
  # a range a dates before and after
  date_0  = Date.today + (shift*2).weeks
  date_1  = date_0 + 1.day
  date_2  = date_0 + 2.days
  date_3  = date_0 + 3.days
  date_4  = date_0 + 4.days
  date_5  = date_0 + 5.days

  # schedule events within spaces
  spaces.each do |space|
    FactoryBot.create(:reservation, space: space, event: events.first,  start_date: date_0, start_time: hour_ev_start, end_date: date_2, end_time: hour_pm_end)
    FactoryBot.create(:reservation, space: space, event: events.second, start_date: date_3, start_time: hour_am_start, end_date: date_3, end_time: hour_am_end)
    FactoryBot.create(:reservation, space: space, event: events.last,   start_date: date_3, start_time: hour_ev_start, end_date: date_3, end_time: hour_ev_end)
    FactoryBot.create(:reservation, space: space, event: events.sample, start_date: date_5, start_time: hour_pm_start, end_date: date_5, end_time: hour_ev_end)
    # space.save
  end
end
