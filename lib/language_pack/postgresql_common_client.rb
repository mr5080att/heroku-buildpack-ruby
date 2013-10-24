require "language_pack"
require "language_pack/base"

class LanguagePack::PostgresqlCommonClient < LanguagePack::Base
  def self.use?
    true
  end

  def name
    "Postgresql Common Client 9.3"
  end

  def compile
    puts "Installing Postgresql Common Client 9.3"
    puts %x[wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -]
	puts %x[sudo apt-get update]
	puts %x[sudo apt-get install postgresql-client-9.3]
  end
end