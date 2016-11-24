class Config < ApplicationRecord
    def self.get name
        config = Config.find_by(name: name)
        
        if config.nil?
            return nil
        else
            return config.value
        end
    end
end
