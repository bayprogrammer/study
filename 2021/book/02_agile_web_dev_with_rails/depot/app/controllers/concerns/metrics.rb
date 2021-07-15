module Metrics
  private

  def show_counter?
    current_count >= 5
  end

  def current_count
    session[:counter] ||= 0
  end

  def increment_counter!
    session[:counter] ||= 0
    session[:counter] += 1
  end

  def reset_counter!
    session[:counter] = 0
  end
end
