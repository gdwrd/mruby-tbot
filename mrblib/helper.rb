class TBot::Helper
  class << self
    OFFSET_DAT_FILE = 'offset.dat'

    def get_offset
      File.exist?(OFFSET_DAT_FILE) ? File.read(OFFSET_DAT_FILE).to_i : 0
    end

    def update_offset(value)
      file = File.new(OFFSET_DAT_FILE, 'w')
      file.puts(value)
      file.close
    end
  end
end
