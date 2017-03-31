OFFSET_VALUE = 123

assert("helper save int to file") do
  TBot::Helper.update_offset(OFFSET_VALUE)

  assert_equal TBot::Helper.get_offset, OFFSET_VALUE
end
