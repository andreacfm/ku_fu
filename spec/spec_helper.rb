require 'rubygems'
require 'active_record'
require 'sqlite3'

require 'ku_fu'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}
FileUtils.mkdir_p File.dirname(__FILE__) + '/../db/'
ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database  => "db/test.sqlite3"

RSpec.configure do |config|
  config.mock_with :rspec
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.before :suite do
    ActiveRecord::Base.connection.create_table(:users,:force => true) do |t|
      t.timestamps
    end
    ActiveRecord::Base.connection.create_table(:documents,:force => true) do |t|
      t.string :title
      t.integer :creator_id
      t.integer :updater_id
      t.integer :deleter_id
      t.timestamps
    end
    User.current = User.create!
  end

  config.before(:each) do
    Document.delete_all
  end

  config.after(:suite) do
    ActiveRecord::Base.connection.drop_table(:users)
    ActiveRecord::Base.connection.drop_table(:documents)
  end
end
