require 'yaml'

module ZengoBot
  class Configuration
    CREDENTIAL_YML = '../../../config/credential.yml'

    def self.credential_env_strings(br = false)
      new.credential_env_strings(br)
    end

    def initialize
      credential_path = File.expand_path(CREDENTIAL_YML, __FILE__)
      @credential     = retrieve_credential(credential_path)
    end

    def credential_env_strings(br = false)
      sep = br ? "\n" : ' '
      @credential.map{ |k, v| "#{k.upcase}=#{v}" }.join(sep)
    end


    private
    def retrieve_credential(credential_path)
      YAML.load_file(credential_path)
    end
  end
end
