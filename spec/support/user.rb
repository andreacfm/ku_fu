class User < ActiveRecord::Base

  class << self
    def current
      @current
    end
    def current=user
      @current = user
    end
  end

end