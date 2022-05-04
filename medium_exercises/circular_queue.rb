=begin
nouns - circular que, objects, position
verb - added, is the queue full? , getting rid of/dioscarded, replaced
most recent vs oldest - states of the object?
=end
require 'pry'

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
    if empty_queue?
      @queue[0] = Member.new(integer)
    elsif full_queue?
      replace_oldest_member(integer)
    else
      add_new_member(integer)
    end
  end

  def empty_queue?
    @queue.all? { |member| member.value.nil? }
  end

  def full_queue?
    @queue.all? { |member| member.value != nil }
  end

  def replace_oldest_member(integer)
    oldest_member = @queue.sort_by { |member| member.age }.first
    @queue[@queue.index(oldest_member)] = Member.new(integer)
  end

  def add_new_member(integer)
    newest_member = @queue.sort_by { |member| member.age }.last
    newest_member_index = @queue.index(newest_member)
    if newest_member_index == @queue.length - 1
      @queue[0] = Member.new(integer)
    else
      @queue[newest_member_index + 1] = Member.new(integer)
    end
  end

  def dequeue
    return nil if empty_queue?

    oldest_member = @queue.select do |member|
      member.value != nil
    end.sort_by { |member| member.age }.first

    @queue[@queue.index(oldest_member)] = Member.new

    return oldest_member.value
  end
end

queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

