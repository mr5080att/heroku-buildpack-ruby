require "language_pack"
require "language_pack/rails4"

class LanguagePack::Backup < LanguagePack::Rails4
  def self.use?
  	# puts "Environment BACKUP: #{ENV["BACKUP"]}"
    # ENV["BACKUP"]
    # manifest.env or manifest.properties doesn't work
    true
  end

  def name
    "Backup Language Pack"
  end

  def compile
    super
    install_postgresql_client
    install_backup_gem
  end

  def install_backup_gem
  	topic "Installing Backup Gem"
  	run "gem install backup"
  end

  def install_postgresql_client
  	topic "Installing Posgtgresql Client 9.3"
  	run "wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -"
	run "sudo apt-get update"
	run "sudo apt-get install postgresql-client-9.3"
  end
end
