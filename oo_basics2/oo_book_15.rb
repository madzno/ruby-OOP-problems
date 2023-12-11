class Student
  attr_accessor :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_then?(student_2)
    self.grade > student_2.grade ? true : false
  end

  protected

  attr_accessor :grade
end

joe = Student.new('joe', 100)
bob = Student.new('bob', 90)

puts "Well done!" if joe.better_grade_then?(bob)
