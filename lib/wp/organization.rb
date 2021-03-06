# frozen_string_literal: true

require_relative './api'
require_relative './data'
require 'spyke'

module Wordpress
  class Organization < Spyke::Base
    include Spyke::Kaminari::Scopes
    include Data

    def summary
      {
        name: name,
        url: url,
        region: region.first['slug'],
        logo: logo['guid']
      }.stringify_keys.to_yaml
    end
  end
end
