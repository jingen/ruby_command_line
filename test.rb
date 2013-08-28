result = %x(ls *)
name = "jingen lin"
result = %Q(#{name}, and backslashes)
puts result
result = "#{name}, and backslashes"
puts result
result = %q(#{name}, and backslashes)
puts result
# result = "#{name}, and backslashes\n"
# puts result