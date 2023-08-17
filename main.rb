require_relative 'app'

OPTIONS = {
  '1' => 'List all books',
  '2' => 'List all Music albums',
  '3' => 'List all Games',
  '4' => 'List all genres',
  '5' => 'List all labels',
  '6' => 'List all Authors',
  '7' => 'Add a book',
  '8' => 'Add a music album',
  '9' => 'Add a Game',
  '10' => 'Quit'
}.freeze

def main
  app = App.new
  puts '**********************************************'
  puts "\nCATALOG OF MY THINGS\n\n"
  puts '**********************************************'
end

main