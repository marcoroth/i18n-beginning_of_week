require "i18n/beginning_of_week/version"
require "i18n"
require "date"
require "active_support/core_ext/date/calculations"

module I18n
  module Locale
    module BeginningOfWeek
      LOCALE_DAYS = {
        'af': 1, 'ar-LY': 6, 'ar-MA': 6, 'ar-SA': 6, 'ar-TN': 1, 'ar': 6,
        'az': 1, 'bg': 1, 'bn': 0, 'bo': 0, 'br': 1, 'bs': 1, 'ca': 1,
        'cs': 1, 'cv': 1, 'cy': 1, 'da': 1, 'de-at': 1, 'de': 1, 'dv': 7,
        'el': 1, 'en-au': 1, 'en-ca': 1, 'en-db': 1, 'en-ie': 1, 'en-nz': 1,
        'en': 0, 'eo': 1, 'es-do': 1, 'es': 1, 'et': 1, 'eu': 1, 'fa': 6,
        'fi': 1, 'fo': 1, 'fr-ca': 1, 'fr-ch': 1, 'fr': 1, 'fy': 1, 'gd': 1,
        'gl': 1, 'gom-latn': 1, 'he': 0 'hi': 0, 'hr': 1, 'hu': 1, 'hy-am': 1,
        'id': 1, 'is': 1, 'it': 1, 'ja': 1, 'jv': 1, 'ka': 1, 'kk': 1, 'km': 1,
        'kn': 0, 'ko': 0, 'ky': 1, 'lb': 1, 'lo': 0, 'lt': 1, 'lv': 1, 'me': 1,
        'mi': 1, 'mk': 1, 'mr': 0, 'ms-my': 1, 'ms': 1, 'my': 1, 'nb': 1,
        'ne': 0, 'nl-be': 1, 'nl': 1, 'nn': 1, 'pa-in': 0, 'pl': 1, 'pt-rb': 0,
        'pt': 1, 'ro': 1, 'ru': 1, 'sd': 1, 'se': 1,'si': 0, 'sk': 1, 'sl': 1,
        'sq': 1, 'sr-cryl': 1, 'sr': 1, 'ss': 1, 'sv': 1, 'sw': 1, 'ta': 0,
        'te': 0, 'tet': 1, 'th': 0, 'tl-ph': 1, 'tlh': 1, 'tr': 1, 'tzl': 1,
        'tzl-latn': 6, 'tzm': 6, 'uk': 1, 'ur': 1, 'uz-latn': 1, 'uz': 1,
        'vi': 1, 'yo': 1, 'zh-cn': 1, 'zh-hk': 1, 'zh-tq': 1
      }.freeze

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        # Get the beginning of week symbol based on the locale
        # @return [Symbol]
        def i18n_beginning_of_week(locale = I18n.locale)
          if day = LOCALE_DAYS[locale]
            i18n_day_names_to_hash[day]
          else
            Date.beginning_of_week
          end
        end

        # Run the block in the context of the i18n beginning of the week
        # @param [Block]
        def in_i18n_beginning_of_week(locale = I18n.locale)
          original_beginning_of_week = Date.beginning_of_week
          Date.beginning_of_week = i18n_beginning_of_week(locale)
          yield
        ensure
          Date.beginning_of_week = original_beginning_of_week
        end

        private

        # Gives us {0=>:sunday, 1=>:monday, 2=>:tuesday, 3=>:wednesday, 4=>:thursday, 5=>:friday, 6=>:saturday}
        # Which is way more useful than Date::DAYS_INTO_WEEK :/
        # @return [Hash<Integer,Symbol>]
        def i18n_day_names_to_hash
          Date::DAYNAMES.each_with_object(Hash.new).with_index do |(day, memo), index|
            memo[index] = day.downcase.to_sym
          end
        end
      end
    end
  end
end

Date.include I18n::Locale::BeginningOfWeek
