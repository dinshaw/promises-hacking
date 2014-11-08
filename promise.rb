class Promise

  attr_accessor :workflow_state

  def initialize(on_start)
    result = on_start.call
    fulfill result
  rescue => e
    reject(e)
  end

  def catch(catch_with)
    method(catch_with).call(@reason) if rejected?
  end

  def then(on_success, rescue_with = nil)
    case workflow_state
    when :fulfilled
      result = method(on_success).call(@value)
      fulfill result
    when :rejected
      method(rescue_with).call(@reason) if rescue_with
      self
    end
  rescue => e
    reject e
  end

  def fulfill(value)
    @workflow_state = :fulfilled
    @value = value
    self
  end

  def reject(e)
    @workflow_state = :rejected
    @reason = e
    self
  end

  def rejected?
    @workflow_state == :rejected
  end
end
