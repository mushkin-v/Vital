class HomeController < ApplicationController

  before_action :require_user, only: [:index]

  def index

  end

end
