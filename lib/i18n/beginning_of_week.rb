require "i18n/beginning_of_week/version"
require "i18n"
require "date"
require "active_support/core_ext/date/calculations"

module I18n
  module Locale
    module BeginningOfWeek
      LOCALE_DAYS = {
        'af': :monday, 'ar-LY': :saturday, 'ar-MA': :saturday, 'ar-SA': :saturday, 'ar-TN': :monday, 'ar': :saturday,
        'az': :monday, 'bg': :monday, 'bn': :sunday, 'bo': :sunday, 'br': :monday, 'bs': :monday, 'ca': :monday,
        'cs': :monday, 'cv': :monday, 'cy': :monday, 'da': :monday, 'de-at': :monday, 'de': :monday, 'dv': :sunday,
        'el': :monday, 'en-au': :monday, 'en-ca': :monday, 'en-db': :monday, 'en-ie': :monday, 'en-nz': :monday,
        'en': :sunday, 'eo': :monday, 'es-do': :monday, 'es': :monday, 'et': :monday, 'eu': :monday, 'fa': :saturday,
        'fi': :monday, 'fo': :monday, 'fr-ca': :monday, 'fr-ch': :monday, 'fr': :monday, 'fy': :monday, 'gd': :monday,
        'gl': :monday, 'gom-latn': :monday, 'he': :sunday, 'hi': :sunday, 'hr': :monday, 'hu': :monday, 'hy-am': :monday,
        'id': :monday, 'is': :monday, 'it': :monday, 'ja': :monday, 'jv': :monday, 'ka': :monday, 'kk': :monday, 'km': :monday,
        'kn': :sunday, 'ko': :sunday, 'ky': :monday, 'lb': :monday, 'lo': :sunday, 'lt': :monday, 'lv': :monday, 'me': :monday,
        'mi': :monday, 'mk': :monday, 'mr': :sunday, 'ms-my': :monday, 'ms': :monday, 'my': :monday, 'nb': :monday,
        'ne': :sunday, 'nl-be': :monday, 'nl': :monday, 'nn': :monday, 'pa-in': :sunday, 'pl': :monday, 'pt-rb': :sunday,
        'pt': :monday, 'ro': :monday, 'ru': :monday, 'sd': :monday, 'se': :monday,'si': :sunday, 'sk': :monday, 'sl': :monday,
        'sq': :monday, 'sr-cryl': :monday, 'sr': :monday, 'ss': :monday, 'sv': :monday, 'sw': :monday, 'ta': :sunday,
        'te': :sunday, 'tet': :monday, 'th': :sunday, 'tl-ph': :monday, 'tlh': :monday, 'tr': :monday, 'tzl': :monday,
        'tzl-latn': :saturday, 'tzm': :saturday, 'uk': :monday, 'ur': :monday, 'uz-latn': :monday, 'uz': :monday,
        'vi': :monday, 'yo': :monday, 'zh-cn': :monday, 'zh-hk': :monday, 'zh-tq': :monday
      }.freeze

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        # Get the beginning of week symbol based on the locale
        # @return [Symbol]
        def beginning_of_week(locale = I18n.locale)
          LOCALE_DAYS[locale] || Date.beginning_of_week
        end

        # Run the block in the context of the i18n beginning of the week
        # @param [Block]
        def in_beginning_of_week(locale = I18n.locale)
          original_beginning_of_week = Date.beginning_of_week
          Date.beginning_of_week = beginning_of_week(locale)
          yield
        ensure
          Date.beginning_of_week = original_beginning_of_week
        end

        private

        # Gives us {0=>:sunday, 1=>:monday, 2=>:tuesday, 3=>:wednesday, 4=>:thursday, 5=>:friday, 6=>:saturday}
        # Which is way more useful than Date::DAYS_INTO_WEEK :/
        # @return [Hash<Integer,Symbol>]
        def day_names_to_hash
          Date::DAYNAMES.each_with_object(Hash.new).with_index do |(day, memo), index|
            memo[index] = day.downcase.to_sym
          end
        end
      end
    end
  end
end

I18n.include I18n::Locale::BeginningOfWeek
