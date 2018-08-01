class StaticPagesController < ApplicationController
  def home
  	render template: "static_pages/home"
  end
end
