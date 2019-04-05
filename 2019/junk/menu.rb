#!/usr/bin/env ruby

#def select_location(location_code)
#  result = "Somewhere fun"
#
#  case location_code
#  when "O"
#    result = "Oregon"
#  when "W"
#    result = "Washington"
#  when "L"
#    result = "London"
#  when "P"
#    result = "Paris"
#  end
#
#  result
#end

#def where_go
#  puts "Where do you want to go today?"
#  puts ""
#  puts "O) Oregon"
#  puts "W) Washington"
#  puts "L) London"
#  puts "P) Paris"
#  puts ""
#  print "> "
#
#  choice = gets.chomp
#
#  puts ""
#  puts "You're going to #{select_location(choice.upcase)}."
#end
#
#where_go

#def question(prompt, choices)
#  puts prompt
#  puts ""
#  choices.each { |code, description| puts "#{code}) #{description}" }
#  puts ""
#  print "> "
#
#  choice = gets.chomp
#  yield(choice) if block_given?
#
#  choice
#end
#
#question(
#  "Where do you want to go today?",
#  "O"=>"Portland",
#  "S"=>"Seattle",
#  "L"=>"London",
#  "P"=>"Paris",
#  "X"=>"Exit"
#) do |choice|
#  if choice.upcase == "X"
#    puts "Good bye."
#    exit
#  end
#  puts "You're going to #{select_location(choice.upcase)}."
#end


def choice(code_and_desc, &block)
  $choices ||= {}

  code_and_desc.each do |code, desc|
    puts "#{code}) #{desc}"
    $choices[code] = block
  end
end


def question(prompt)
  puts prompt
  puts ""

  yield

  puts ""
  print "> "

  choice = gets.chomp
  action = $choices[choice]

  # TODO(zmd): ugly and ineffecient (if same menu in loop) -- globals YUCK!
  $choices = nil

  if action
    action.()
  else
    puts "Unknown option selected."
  end
end

question 'Where do you want to go today?' do
  youre_going_to = Proc.new do |where_to|
    puts "You're going to #{where_to}!"
    puts ""
  end

  choice 'O' => 'Oregon' do
    question 'Where in Oregon?' do
      choice 'P' => 'Portland' do
        youre_going_to.('Portland, Oregon')
      end

      choice 'C' => 'Coos Bay' do
        youre_going_to.('Coos Bay, Oregon')
      end
    end
  end

  choice 'W' => 'Washington' do
    question 'Where in Washington?' do
      choice 'S' => 'Seattle' do
        youre_going_to.('Seattle, Washington')
      end

      choice 'K' => 'Spokaine' do
        youre_going_to.('Spokaine, Washington')
      end
    end
  end

  choice 'E' => 'England' do
    question 'Where in England?' do
      choice 'L' => 'London' do
        youre_going_to.('London, England')
      end

      choice 'C' => 'Canterbury' do
        youre_going_to.('Canterbury, England')
      end
    end
  end

  choice 'F' => 'France' do
    question 'Where in France?' do
      choice 'P' => 'Paris' do
        youre_going_to.('Paris, France')
      end

      choice 'C' => 'Cailis' do
        youre_going_to.('Cailis, France')
      end
    end
  end

  puts ""

  choice 'X' => 'Exit' do
    puts "Good bye."
    exit 0
  end
end

# TODO(zmd): infinite loop:
#   - [ ] how to return to previous level?
#   - [ ] how to have global exit choice at top level?
