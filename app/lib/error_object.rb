class ErrorObject
  attr_accessor :state, :message

  def initialize(state = false, message = '')
    @state = state
    @message = message
  end
end
