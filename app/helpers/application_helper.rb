module ApplicationHelper
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
