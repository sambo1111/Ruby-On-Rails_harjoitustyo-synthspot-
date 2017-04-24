class AdminPanelController < ApplicationController
  before_action :ensure_that_is_admin, only: [:index]

  def index

  end
end
