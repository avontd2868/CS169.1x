#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  letters = str.downcase.scan(/\w/)
  letters == letters.reverse
end

def count_words(str)
  res = Hash.new(0)
  str.downcase.scan(/\w+/).map{|word| res[word] = str.downcase.scan(/\b#{word}\b/).size}
  return res
end