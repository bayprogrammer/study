class ZArray < Array
  def zfind
    each do |value|
      return value if yield(value)
    end
  end
end

z = ZArray.new([1, 3, 5, 7, 9])
p z.find {|v| v*v > 30 }
