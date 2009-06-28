require 'rubygems'
require 'active_record'
require 'yaml'

adapter_attrs = YAML.load(File.open('config/database.yml') { |f| f.read })
ActiveRecord::Base.establish_connection(adapter_attrs)

ActiveRecord::Schema.define do
  create_table(:tweets, :force => true) do |t|
    t.string      :twitter_id
    t.datetime    :published
    t.string      :link
    t.string      :title
    t.string      :content
    t.string      :author_name
    t.string      :author_uri
    t.boolean     :tweeted
  end
end
