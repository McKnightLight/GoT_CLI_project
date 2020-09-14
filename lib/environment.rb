require 'pry'
require 'rest-client'
require 'json'

require_relative "./characters"
require_relative "./api"
require_relative "./cli"

CLI.new.run 

API.get_characters