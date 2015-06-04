# a. Store the list of speaker names outside your method so you can send it to the printer. 
speakers = ["Edsger","Ada","Charles","Alan","Grace","Linus","Matz"]

# 1. Write a badge_maker method that will create and return this message, given a person's name.
# ex:
#
#    badge_maker("Arel")
#    => "Hello, my name is Arel."
#    " should return a formatted badge"

def badge_maker(name)
  return "Hello, my name is #{name}." # or skip 'return', just using it here to be explicit
end


#  b. Write a batch_badge_creator method that takes a list of names as an argument and return a list of badge messages. 
# Hint: Use the variable you created in part a. == speakers array
# collect iterates over the array and creates a new array containing modified values.

def batch_badge_creator(speakers) # because it takes array as an argument, it will go through each of the array contents
  speakers.collect { |x| badge_maker(x)} #technically, it returns an array of new messages, not really separate messages
end

# 3. You just realized that you also need to give each speaker a room assignment. 
# Write a method called assign_rooms that takes the list of speakers that will assign each speaker to a room. Make sure that each room only has one speaker.
#  * You have rooms 1-7. 
#  * return a list of room assignments in the form of: "Hello, _____! You'll be assigned to room _____!"

def assign_rooms(speakers) # same logic -- using array as an argument
  speakers.collect { |x| "Hello, #{x}! You'll be assigned to room #{speakers.index(x)+1}!" }
end

# 4. Now you have to tell the printer what to print. 
# Create a method called 'printer' that will output the results of the batch_badge_creator method 
# and the assign_rooms method to the screen.

def printer(speakers) # the rspec seems to indicate this is 'attendees', but it seems to work for 'speakers' also
  badge_array = batch_badge_creator(speakers)
  room_array = assign_rooms(speakers)
  count_of_speakers = speakers.length # don't have to use new variable here, but might as well since we are creating it (and it was done that way in lecture)
  order = 0
  while order < count_of_speakers 
    puts badge_array[order] # this works excellently because we start at 0, just like 0th index in the array
    puts room_array[order]
    order += 1
  end
end
  
# other possible solutions to the printer method:
#  - .zip method and then iterate over it
#  - nested loop methos (see lecture in class)
