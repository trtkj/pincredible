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

  def tag2link(text)
    newText = String.new(text)
    text.scan(/#([^(\s|#)]+)\s?/){ |matched|
      tag = Tag.find_by(name: matched)
      newText.gsub!("#" + matched[0], "<a class = 'tag-link' href = '/tags/#{tag.id}'>##{tag.name}</a> ")
    }
    return newText;
  end
end
