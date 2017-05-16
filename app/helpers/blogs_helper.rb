module BlogsHelper
  
  # HTTPメソッドによって宛先を分岐
  def choose_new_or_edit
    if action_name == "new" || action_name == "confirm"
      
      # これが return になる
      confirm_blogs_path
      
    elsif action_name == "edit"
      
      # これが patch blog/edit のパス
      blog_path
    end
      
  end
  
end
