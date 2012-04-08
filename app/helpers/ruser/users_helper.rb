# coding: utf-8
require "digest/md5"
module Ruser::UsersHelper
#  include Ruser::Engine.routes.url_helpers
  
  # 生成用户 login 的链接，user 参数可接受 user 对象或者 字符串的 login
  def user_name_tag(user,options = {})
    return "匿名" if user.blank?
#what is this for, this means, user is a string?
    if (user.class == "".class)
      login = user
      name = login
    else
      login = user.login
      name = user.name
    end

    name ||= login
     link_to(login, ruser.user_path(login), 'data-name' => name)
  end

  def user_avatar_width_for_size(size)
    case size
      when :normal then 48
      when :small then 16
      when :large then 64
      when :big then 120
      else size
    end
  end
  
  def user_avatar_tag(user, size = :normal, opts = {})
    link = opts[:link] || true
    
    width = user_avatar_width_for_size(size)
    
    if user.blank?
      hash = Digest::MD5.hexdigest("")
      return image_tag("http://gravatar.com/avatar/#{hash}.png?s=#{width}")
    end

    if user.avatar.blank?
      hash = Digest::MD5.hexdigest(user.email || "")
      img_src = "http://gravatar.com/avatar/#{hash}.png?s=#{width}"
      img = image_tag(img_src, :style => "width:#{width}px;height:#{width}px;")
    else
      img = image_tag(user.avatar.url(size), :style => "width:#{width}px;height:#{width}px;")
    end

    if link

     raw %(<a href="/ruser/users/#{user.login}" #{user_popover_info(user)} class="user_avatar">#{img}</a>)

    else
      raw img
    end
  end
  
  def render_user_join_time(user)
    I18n.l(user.created_at.to_date, :format => :long)
  end

  def render_user_tagline(user)
    user.tagline
  end

  def render_user_github_url(user)
    link_to(user.github_url, user.github_url, :target => "_blank", :rel => "nofollow")
  end

  def render_user_personal_website(user)
    website = user.website[/^https?:\/\//] ? user.website : "http://" + user.website
    link_to(website, website, :target => "_blank", :rel => "nofollow")
  end

  def render_user_level_tag(user)
    if admin?(user)
      content_tag(:span, t("common.admin_user"), :class => "label warning role")
    elsif wiki_editor?(user)
      content_tag(:span, t("common.wiki_admin"), :class => "label success role")
    else
      content_tag(:span,  t("common.limit_user"), :class => "label role")
    end
  end

  private

  def user_popover_info(user)
    return "" if user.blank?
    return "" if user.location.blank?
    name = user.name
    name = user.login if name.blank?
    title = user.location.blank? ? "#{name}" : "<i><span class='icon small_pin'></span>#{user.location}</i> #{name}"
    tagline = user.tagline.blank? ? "这哥们儿没签名" : truncate(user.tagline, :length => 20)
    raw %(rel="userpopover" title="#{h(title)}" data-content="#{h(tagline)}")
  end
  
  
  #move some application controller method to here
  def render_404
    render_optional_error_file(404)
  end

  def render_403
    render_optional_error_file(403)
  end

  def render_optional_error_file(status_code)
    status = status_code.to_s
    if ["404","403", "422", "500"].include?(status)
      render :template => "ruser/errors/#{status}", :format => [:html], :handler => [:erb], :status => status, :layout => "application"
    else
      render :template => "ruser/errors/unknown", :format => [:html], :handler => [:erb], :status => status, :layout => "application"
    end
  end


  def notice_success(msg)
    flash[:notice] = msg
  end

  def notice_error(msg)
    flash[:notice] = msg
  end

  def notice_warning(msg)
    flash[:notice] = msg
  end

  def set_seo_meta(title = '',meta_keywords = '', meta_description = '')
    if title.length > 0
      @page_title = "#{title}"
    end
    @meta_keywords = meta_keywords
    @meta_description = meta_description
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def redirect_referrer_or_default(default)
    redirect_to(request.referrer || default)
  end

  def require_user
    if current_user.blank?
      respond_to do |format|
        format.html  {
          authenticate_user!
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end
end

