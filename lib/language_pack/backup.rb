require "language_pack"
require "language_pack/rails4"

class LanguagePack::Backup < LanguagePack::Rails4
  def self.use?
    # puts "Environment BACKUP: #{ENV["BACKUP"]}"
    # ENV["BACKUP"]
    # manifest.env or manifest.properties doesn't work
    # forcing true
    true
  end

  def name
    "Rails 4 with Backup Support"
  end

  def compile
    super
    install_postgresql_client
    install_backup_gem
  end

  def install_postgresql_client
    topic "Installing Posgtgresql Client 9.3"
    puts %x[wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -]
    puts %x[sudo apt-get update]
    puts %x[sudo apt-get install postgresql-client-9.3]
  end
  
  def install_backup_gem
    topic "Installing Backup Gem"
    puts %x[gem install backup]
  end

  def create_database_yml
  end
end
