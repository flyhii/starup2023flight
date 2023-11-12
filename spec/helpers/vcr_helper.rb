# frozen_string_literal: true

require 'vcr'
require 'webmock'

# Setting up VCR
module VcrHelper
  CASSETTES_FOLDER = 'spec/fixtures/cassettes'
  INSTAGRAM_CASSETTE = 'instagram_api'

  def self.setup_vcr
    VCR.configure do |c|
      c.cassette_library_dir = CASSETTES_FOLDER
      c.hook_into :webmock
    end
  end

  def self.configure_vcr_for_instagram
    VCR.configure do |c|
      c.filter_sensitive_data('<INSTAGRAM_TOKEN>') { INSTAGRAM_TOKEN }
      c.filter_sensitive_data('<INSTAGRAM_TOKEN_ESC>') { CGI.escape(INSTAGRAM_TOKEN) }
    end

    VCR.insert_cassette(
      INSTAGRAM_CASSETTE,
      record: :new_episodes,
      match_requests_on: %i[method uri headers]
    )
  end

  def self.eject_vcr
    VCR.eject_cassette
  end
end