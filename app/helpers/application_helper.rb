module ApplicationHelper
  def frontEndHeaders
    @enable_nav = true
    @headers = [{:title=>"我的訂單",:link=>"/account/orders"}]
  end
  def backEndHeaders
    @enable_nav = true
    @headers = [{:title=>"商品上架",:link=>"/admin/products/new"},{:title=>"訂單列表",:link=>"/admin/orders/"}]
  end
end
