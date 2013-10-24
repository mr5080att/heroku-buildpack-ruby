require "language_pack"
require "language_pack/base"

class LanguagePack::Backup < LanguagePack::Rails4
  def self.use?
    ENV["BACKUP"].nil?
  end

  def name
    "Backup Language Pack"
  end

  def compile
    install_postgresql_client
    install_backup_gem
    super
  end

  def install_backup_gem
  	topic "Installing Backup Gem"
  	comand "gem install backup"
  end

  def install_postgresql_client
  	topic "Installing Posgtgresql Client 9.3"
  	command "wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -"
	command "sudo apt-get update"
	command "sudo apt-get install postgresql-client-9.3"
  end
end
