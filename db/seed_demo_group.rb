module SeedDemoGroup
  def self.create

    spaces = []
    spaces << FactoryBot.create(:space, space_name: "Center")
    spaces << FactoryBot.create(:space, space_name: "Anex")

    create_events
  end

  # delete and recreate all events
  # def self.reset_events
  #   error_message = "DemoGroup not found please run: `bin/rails runner SeedDemoGroup.create`"
  #   raise StandardError, error_message  if tenant.blank?

  #   # re-create all events
  #   create_events
  # end

  def self.create_events
    spaces     = Space.first
    # error_message = "DemoGroup not found please run: `bin/rails runner SeedDemoGroup.create`"

    events = []
    5.times do
      event   = FactoryBot.create :event
      events << event
    end

    (-4..4).each do |shift|
      date_0  = Date.today + (shift*2).weeks
      date_1  = date_0 + 1.day
      date_2  = date_0 + 2.days
      date_3  = date_0 + 3.days
      date_4  = date_0 + 4.days
      date_5  = date_0 + 5.days
      # event = FactoryBot.create :event, category: categories.sample, tenant: tenant

      hour_am_start = Time.new('09:30')
      hour_am_end   = Time.new('12:30')
      hour_pm_start = Time.new('13:30')
      hour_pm_end   = Time.new('17:30')
      hour_ev_start = Time.new('18:30')
      hour_ev_end   = Time.new('20:30')

      # schedule events within spaces
      spaces.each do |space|
        FactoryBot.create(:reservation, space: space, event: events.first,  start_date: date_0, start_time: hour_ev_start, end_date: date_2, end_time: hour_pm_end)
        FactoryBot.create(:reservation, space: space, event: events.second, start_date: date_3, start_time: hour_am_start, end_date: date_3, end_time: hour_am_end)
        FactoryBot.create(:reservation, space: space, event: events.last,   start_date: date_3, start_time: hour_ev_start, end_date: date_3, end_time: hour_ev_end)
        FactoryBot.create(:reservation, space: space, event: events.sample, start_date: date_5, start_time: hour_pm_start, end_date: date_5, end_time: hour_ev_end)
        # space.save
      end
    end
  end

end
