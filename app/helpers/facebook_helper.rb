module FacebookHelper

  def facebook_avatar
    avatar_url = current_user.facebook_picture_url || "http://placehold.it/30x30"
    image_tag avatar_url, class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown"
  end

  def facebook_avatar_big
    avatar_url = current_user.facebook_picture_url || "http://placehold.it/150x150"
    image_tag avatar_url, class: "avatar-monster"
  end
end
