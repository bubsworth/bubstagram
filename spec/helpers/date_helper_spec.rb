# frozen_string_literal: true

require "rails_helper"

RSpec.describe DateHelper, type: :helper do
  describe "#formatted_time" do
    context "notifcation created under 24 hours" do
      it "returns a time with the format 11:00" do
        result = formatted_time(Date.new(2020, 1, 1, 11))
        expect(result).to eq "11:00"
      end
    end

    context "notifcation created over 24 hours" do
      it "returns a date with the format 1 Jan 2020" do
        result = formatted_time(Date.new(2020, 1, 1))
        expect(result).to eq "1 Jan 2020"
      end
    end
  end
end