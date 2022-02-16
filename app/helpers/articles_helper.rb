module ArticlesHelper
  def article_image_thumbnail(article, width, height, article_image_thumbnail_class)
    if article.article_image.attached?
      image_tag(article.article_image, :width => width, :height => height, :class => article_image_thumbnail_class)
    else
      content_tag(:i, "", :class => "far fa-8x fa-paper-plane", :width => width, :height => height)
    end
  end
end
