class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

maddy = Graduate.new('maddy', 2015, true)
p maddy

ben = Undergraduate.new('ben', 2013)
p ben
