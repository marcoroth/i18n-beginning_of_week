require "spec_helper"

RSpec.describe I18n::BeginningOfWeek do
  before do
    I18n.available_locales = %w(ar)
  end

  it "has a version number" do
    expect(I18n::BeginningOfWeek::VERSION).not_to be nil
  end

  describe "Date.i18n_beginning_of_week should return the beginning of the week" do
    it "based on passed locale" do
      expect(Date.i18n_beginning_of_week(:ar)).to eq(:saturday)
    end

    it "based on set locale" do
      I18n.locale = :ar
      expect(Date.i18n_beginning_of_week).to eq(:saturday)
    end

    it "for the default locale if no beginnnig of week value exists" do
      expect(Date.i18n_beginning_of_week(:invalid)).to eq(:monday)
    end
  end

  describe "Date.in_i18n_beginning_of_week should perform the block" do
    it "based on the passed locale" do
      day = Date.in_i18n_beginning_of_week(:ar) do
        Date.beginning_of_week
      end
      expect(day).to eq(:saturday)
    end

    it "based on the set locale" do
      I18n.locale = :ar
      day = Date.in_i18n_beginning_of_week do
        Date.beginning_of_week
      end
      expect(day).to eq(:saturday)
    end
  end
end
