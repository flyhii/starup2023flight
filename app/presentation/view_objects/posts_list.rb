# frozen_string_literal: true

module Views
    # View for a a list of project entities
   class HashtagsList
     def initialize(hashtags)
       @hashtags = hashtags.map.with_index { |hash, i| Project.new(hash, i) }
     end
 
     def each(&show)
       @hashtags.each do |hash|
         show.call hash
       end
     end
 
     def any?
       @hashtags.any?
     end
   end
 end
 