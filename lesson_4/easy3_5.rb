class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer #error message
tv.model # will perform what ever action is specified in 'model' method

Television.manufacturer # will perform method logic
Television.model # error message
