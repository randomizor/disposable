require 'disposable'
require 'minitest/autorun'

class Track
  def initialize(options={})
    @title = options[:title]
  end

  attr_reader :title
end


# require 'active_record'
# require 'database_cleaner'
# DatabaseCleaner.strategy = :truncation

require 'active_record'
class Artist < ActiveRecord::Base
  has_many :albums
end

class Song < ActiveRecord::Base
  belongs_to :artist
end

class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artist
end

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "#{Dir.pwd}/database.sqlite3"
)

# uncomment this once to create a database for testing:

# ActiveRecord::Schema.define do
#   create_table :artists do |table|
#     table.column :name, :string
#     table.timestamps
#   end
#   create_table :songs do |table|
#     table.column :title, :string
#     table.column :artist_id, :integer
#     table.column :album_id, :integer
#     table.timestamps
#   end
#   create_table :albums do |table|
#     table.column :name, :string
#     table.timestamps
#   end
# end