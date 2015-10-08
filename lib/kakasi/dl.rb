def suppress_warning
  require 'stringio'
  old_stderr = $stderr
  $stderr = StringIO.new
  yield
ensure
  $stderr = old_stderr
end

module Kakasi
  module Lib
    suppress_warning do
      require 'dl/import'
    end
    Fiddle = DL
    Pointer = DL::CPtr
  end
end

require 'kakasi/fiddle'
