require './lib/ruby_gems_client'

class ShowCommandHandler
  def self.execute(arguments_string)
    RubyGemsClient.info(arguments_string)
  end
end
