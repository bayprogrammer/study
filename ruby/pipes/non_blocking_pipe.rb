#!/usr/bin/env ruby

class Interupt < StandardError; end

def interupt
  raise Interupt
end

def block
  yield if block_given?
  sleep
rescue Interupt
  true
end

def unblock(pid)
  Process.kill(:USR1, pid)
end

# -----------------------------------------------------------------------------

class Reader
  attr_reader :reader, :open

  def initialize(reader)
    @reader = reader
    @reading = false
    @open = true
  end

  def close
    @reading = false
    @open = false
  end

  def read
    string = ""

    while reading
      begin
        fragment = reader.readpartial(4096)
        string << fragment
        reading = false if /\n.EOL.\n/m.match(fragment)
      rescue EOFError
        close
      end
    end
    reader.close unless @open
    string
  end
end

r, w = IO.pipe

parent_pid = $$
child_pid = fork do
  w.close
  reader = Reader.new(r)

  def process_incoming_data
    puts "Processing..."
    puts reader.read.length
    puts "Processing complete."
  end

  trap(:TERM) do
    reader.close
    running = false
    interupt
  end

  trap(:USR1) do
    interupt
  end

  while running
    block
    process_incoming_data

    # tell the parent we're done processing
    unblock(parent_pid)
  end
end

# -----------------------------------------------------------------------------

interupted = false

trap(:USR1) do
  interupt unless interupted
end

# close parent's copy of the pipe reader
r.close

# parent process' work
block do
  w.puts("Hello, world.")
  unblock(child_pid)
end

puts "Hello from parent"

sum = 2 + 2

block do
  w.puts(sum)
  unblock(child_pid)
end

lorem = <<EOF
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus nunc purus, id dictum nisl faucibus ut. Quisque ornare lacus in urna facilisis, vitae egestas lectus lobortis. Curabitur erat risus, convallis in tincidunt et, porta eu metus. Aliquam euismod ipsum sit amet turpis fringilla, vel aliquam ante accumsan. Nullam dapibus sit amet nulla a dignissim. Sed ultrices, arcu sit amet tristique convallis, nulla purus blandit diam, vitae placerat felis enim vel quam. Ut in augue tempor, efficitur magna in, finibus ex. Vestibulum volutpat ante non ex aliquet convallis. Donec vel pellentesque erat, ac convallis augue. Mauris at velit efficitur, auctor magna a, rhoncus odio. Suspendisse mattis, dolor id iaculis tincidunt, dolor nisl dictum neque, sit amet convallis sem turpis ac elit.

Phasellus porta elit nec feugiat rhoncus. Morbi posuere, lacus vel vulputate feugiat, felis nisi bibendum lectus, eu fringilla ex libero eu erat. Suspendisse pretium malesuada sapien in sagittis. Aliquam dapibus, massa id facilisis scelerisque, leo lectus facilisis lacus, non feugiat velit eros non odio. Aliquam eget eros id diam euismod tempor. Donec nec gravida tortor. Aliquam erat volutpat.

Aliquam tempor, nibh aliquet scelerisque luctus, orci orci convallis metus, vitae sodales tortor ipsum et mi. Sed maximus vestibulum arcu, quis convallis nulla efficitur vel. Vestibulum nec nibh quis tortor convallis mollis quis mollis eros. Integer in facilisis sem. Suspendisse facilisis lobortis scelerisque. Vestibulum efficitur, augue ut gravida lobortis, nibh orci cursus augue, at aliquam metus est quis enim. Praesent faucibus justo eget orci semper, malesuada aliquam enim tincidunt. Sed a enim mauris. Aliquam porttitor, ex et facilisis malesuada, tellus elit dignissim lectus, nec molestie massa turpis nec justo. Pellentesque gravida sem ut suscipit bibendum. Maecenas at semper libero, eget porta orci. Donec enim tellus, imperdiet at ipsum a, auctor euismod purus. Pellentesque eget tincidunt sapien.

Proin molestie dapibus tempus. Suspendisse non sagittis nunc. Donec gravida lobortis orci ut dignissim. Aliquam congue augue augue, ut placerat augue egestas efficitur. Nam sit amet consectetur elit, suscipit mollis risus. Maecenas scelerisque aliquam dui, non mollis velit suscipit nec. Cras nibh neque, ornare vel viverra et, blandit eget augue.

Morbi sed pulvinar odio. Vivamus suscipit nec neque ut dapibus. Cras at lectus dictum, molestie arcu rutrum, rutrum massa. Integer purus nisi, sollicitudin id ultricies quis, lobortis ut lectus. Maecenas efficitur metus bibendum erat cursus, in feugiat lacus facilisis. Nullam eget elit volutpat orci vulputate pharetra. Vivamus in suscipit lectus. Nullam aliquet est non magna vulputate fermentum. Morbi suscipit tellus diam, non semper est sagittis nec. Cras erat velit, ullamcorper in venenatis et, ultricies sed lectus. Vestibulum ac ornare lorem. Duis convallis ultrices molestie. Vestibulum ornare metus a viverra finibus. Nulla ornare suscipit risus, sed varius lectus. Fusce lobortis, quam sed cursus rutrum, urna arcu posuere leo, id hendrerit lacus odio eleifend lectus. Sed pretium eros eros, eu laoreet mi mattis eu.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut eget congue odio. In nec nisl dui. Integer sit amet fermentum ipsum. Nulla rhoncus sed justo eget tempus. Aenean vel volutpat leo. Maecenas mi ipsum, pellentesque et velit a, rhoncus feugiat arcu.

Cras ipsum orci, pretium vitae felis ac, dapibus volutpat leo. Aenean scelerisque, eros suscipit aliquet efficitur, eros massa rutrum risus, vitae gravida ligula tellus quis lorem. Donec venenatis quam sem, non rutrum mauris semper sed. In libero dui, fringilla quis purus quis, aliquet hendrerit nulla. Suspendisse dignissim leo id vehicula viverra. Fusce at facilisis ante, non feugiat libero. Mauris sed vulputate est. Etiam eu nunc eu mauris viverra cursus. Nunc auctor non turpis vel aliquam. Mauris vitae ante ut risus blandit imperdiet quis volutpat mi. Curabitur viverra accumsan est, id viverra nunc viverra in. Vestibulum sollicitudin, turpis quis porta venenatis, velit sapien viverra massa, ac pulvinar turpis lacus sed velit. Maecenas nec luctus ligula. Integer eu malesuada dui.

Vivamus interdum, orci eu hendrerit volutpat, justo risus gravida lorem, id ultrices odio ex et lacus. Sed volutpat magna et dui faucibus sodales. Vivamus pellentesque sit amet risus eu feugiat. Phasellus laoreet mattis nunc cras amet.
EOF

block do
  w.puts(lorem)
  unblock(child_pid)
end

puts 'wrote lorem ipsum!!! \o/'

# shut it down
w.close
Process.kill(:TERM, child_pid)
Process.wait
