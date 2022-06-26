# parameter shift default is 0 if shift is > 0 the letters are shifted in the array
# return a hash with two arrays of letters :uppercase A..Z and :lowercase a..z
def get_alphabet(shift_value = 0)
    alphabet = {}
    alphabet[:upper_case] = ("A".."Z").to_a
    alphabet[:lower_case] = ("a".."z").to_a
  
    if shift_value > 0
      # append the first "shif_value" of elements
      alphabet[:upper_case] = alphabet[:upper_case].push(alphabet[:upper_case].shift(shift_value)).flatten
      alphabet[:lower_case] = alphabet[:lower_case].push(alphabet[:lower_case].shift(shift_value)).flatten
    end
  
    alphabet
  end
  
  # Takes a letter and returns an encrypted letter
  def get_encrypted_letter(letter, alphabet, cipher)
    # return letter if it's anything but A..Za..z
    unless alphabet[:upper_case].include?(letter.upcase)
      return letter
    end
  
    # return the encrypted letter
    if letter == letter.upcase
      return cipher[:upper_case][alphabet[:upper_case].index(letter)]
    end
  
    cipher[:lower_case][alphabet[:lower_case].index(letter)]
  end
  
  def caesar_cipher(message, shift_value)
    alphabet = get_alphabet()
    cipher = get_alphabet(shift_value)
  
    #convert the message into an array of characters
    message_array = message.split('')
    
    # encrypt each letter and join the array back into a string
    message_array.map { |letter| letter = get_encrypted_letter(letter, alphabet, cipher) }.join('')
  end
  
  puts "Encrypting: \"What a string!\""
  puts "..."
  puts caesar_cipher("What a string!", 5)
  puts "..."
  puts "Expected: \"Bmfy f xywnsl!\""