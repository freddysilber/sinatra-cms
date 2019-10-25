ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

def fi_check_migration
  begin
    ActiveRecord::Migration.check_pending!
  rescue ActiveRecord::PendingMigrationError
    raise ActiveRecord::PendingMigrationError.new <<-DBMSG
      Migrations are pending. To resolve this issue, run:
      rake db:migrate SINATRA_ENV=test
      DBMSG
  end
end

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'