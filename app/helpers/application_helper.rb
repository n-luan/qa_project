module ApplicationHelper

  def full_title(page_title="")
    base_title = "Training Ruby on Rails"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
  
end
