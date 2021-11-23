# frozen_string_literal: true

module DateHelper
    def formatted_time(time)
        if time > time+24.hours
            time.try(:strftime, "%d-%m-%y")
        else
            time.try(:strftime, "%k:%M")
        end
    end
end