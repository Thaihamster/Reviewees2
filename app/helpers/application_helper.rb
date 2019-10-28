module ApplicationHelper

#ページごとの完全なタイトル設定
  def full_title(page_title = '')
    base_title = "Reviewees"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
