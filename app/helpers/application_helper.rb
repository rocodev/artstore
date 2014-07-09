module ApplicationHelper
  def frontEndHeaders
    @enable_nav = true
    @headers = [{:title=>"我的購物車",:link=>"/"},{:title=>"我的訂單",:link=>"/"}]
  end
  def backEndHeaders
    @enable_nav = true
    @headers = [{:title=>"商品上架",:link=>"/back_end"}]
  end
end
