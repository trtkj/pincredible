module ApplicationHelper
  def is_mine?(instance)
    user_signed_in? && current_user == instance.user
  end

  def board_show?
    controller_path == "boards" && action_name == "show"
  end

  def my_page?
    user_signed_in? && current_user == @user
  end
end
