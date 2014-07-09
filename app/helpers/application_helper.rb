module ApplicationHelper
  def frontEndHeaders
    @enable_nav = true
    @headers = [{:title=>"我的購物車",:link=>"/"},{:title=>"我的訂單",:link=>"/"}]
    addBackendLink if user_signed_in?
  end
  def backEndHeaders
    @enable_nav = true
    @headers = [{:title=>"商品上架",:link=>"/back_end"}]
  end

  def addBackendLink
    @headers.push({:title=>"後台",:link=>"/back_end"}) if current_user.admin?
  end
end
