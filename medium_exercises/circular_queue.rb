=begin
nouns - circular que, objects, position
verb - added, is the queue full? , getting rid of/dioscarded, replaced
most recent vs oldest - states of the object?
=end

class Member
  attr_accessor :age, :value

  def initialize(value = nil)
    @age = Time.now
    @value = value
  end
end

class CircularQueue
  def initialize(buffer_length)
    @queue = []
    (0...buffer_length).each do |idx|
      @queue[idx] = Member.new
    end
  end

  def enqueue(integer)
     if @queue.all? { |member| member.value.nil? }
       @queue[0] = Member.new(integer)
     elsif

    # else, add integer to the next position (index + 1) of the newest aged object
    # else, if the queue is full add the new integer to the value of the oldest member (replace)
  end

  def dequeue(integer)
    # remove the oldest member of the queue and replace with default member (value = nil) -
    # return the value of that member (will be integer or nill if default member)
  end
end

queue = CircularQueue.new(3)
p queue
