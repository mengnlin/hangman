class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end 

  def initialize 
    @secret_word=Hangman.random_word
    @guess_word=Array.new(@secret_word.length,'_')
    @attempted_chars=[]
    @remaining_incorrect_guesses=5
  end 

  def guess_word
    @guess_word
  end 
  def attempted_chars
    @attempted_chars
  end 
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end 

  def already_attempted?(num)
    if @attempted_chars.include?(num)
      return true 
    else  
      return false
    end 
  end 
def get_matching_indices(char)
    index_to=[]
    @secret_word.each_char.with_index do |ele,idx| 
      if ele==char
        index_to << idx
      end
    end  
    index_to
end 

def fill_indices(char,arr)
  arr.each do |inx| 
    guess_word[inx]=char 
  end 
end 

def try_guess(char)
  if already_attempted?(char)
    p 'that has already been attempted'
    return false 
  elsif get_matching_indices(char).empty?
    @remaining_incorrect_guesses-=1
    @attempted_chars << char
    return true 
  elsif !get_matching_indices(char).empty?
    @attempted_chars << char
    fill_indices(char,get_matching_indices(char))
    return true
  end 
end  
def ask_user_for_guess 
  p 'Enter a char:' 
  guessed_char=gets.chomp
  return try_guess(guessed_char)
end  

def win?
  if @guess_word.join('')==@secret_word 
    p 'WIN' 
    true 
  else 
    false 
  end
end 

def lose?
   if @remaining_incorrect_guesses==0 
    p 'LOSE'
    return true 
   else  
    return false 
   end 
end 

 def game_over?
  @secret_word
  if win?||lose? 
    return true 
  else  
    return false 
  end 
end
end 