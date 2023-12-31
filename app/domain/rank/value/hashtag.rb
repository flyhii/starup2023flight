# frozen_string_literal: true
# need to change!!!!!!!!!!!!!

require 'dry-types'
require 'dry-struct'

module FlyHii
  module Entity
    # Domain entity for hashtag
    class Hashtag < Dry::Struct
      include Dry.Types

      attribute :api_id,       Strict::String.optional
      attribute :hashtag_name, Strict::String

      def to_attr_hash
        to_hash.except(:api_id, :hashtag_name)
      end
    end
  end
end
