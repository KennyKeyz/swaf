class StaticPagesController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:home, :contact, :help, :about]


  def home
  end

  def contact
  end

  def help
  end

  def about
  end
end
