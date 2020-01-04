require 'i18n'
I18n.load_path << Dir[File.expand_path('codebreaker_ap/storage_files/locales', __dir__) + '/*.yml']
I18n.available_locales = :en, :ru
require 'yaml'
require 'codebreaker_ap/modules/storage'
require 'codebreaker_ap/modules/statistic'
require 'codebreaker_ap/entities/message'
require 'codebreaker_ap/modules/errors'
require 'codebreaker_ap/modules/validation'
require 'codebreaker_ap/entities/validator.rb'
require 'codebreaker_ap/entities/player'
require 'codebreaker_ap/entities/difficulty'
require 'codebreaker_ap/game'
require 'codebreaker_ap/version'
