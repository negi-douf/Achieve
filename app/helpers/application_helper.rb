module ApplicationHelper
  require "mini_magick"

  def profile_img(user)
    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end

    #return
    image_tag(img_url, alt: user.name, :size => "50x50")
  end
end
