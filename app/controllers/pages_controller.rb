class PagesController < ApplicationController
  skip_before_filter :authorize
  
  def about
    @page_title = "About Ecoweb"
  end

  def contact
    @page_title = "Contact us"
  end

  def home
    @page_title = "Home"
  end
end
