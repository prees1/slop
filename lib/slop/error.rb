module Slop
  # Base error class.
  class Error < StandardError
  end

  # Raised when calling `call` on Slop::Option (this
  # method must be overriden in subclasses)
  class NotImplementedError < Error
  end

  # Raised when an option that expects an argument is
  # executed without one. Suppress with the `suppress_errors`
  # config option.
  class MissingArgument < Error
    attr_reader :flags; 

    # Get all the flags that matches
    # the option with the missing argument
    def initialize(msg, flags)
      super(msg)
      @flags = flags
    end
  end

  # Raised when an unknown option is parsed. Suppress
  # with the `suppress_errors` config option.
  class UnknownOption   < Error;
    attr_reader :flag

    def initialize(msg, flag)
      super(msg)
      @flag = flag
    end
  end
end
