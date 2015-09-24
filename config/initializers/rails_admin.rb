RailsAdmin.config do |config|
  # config.authorize_with :cancan #TODO add cancancan to rails_admin config
  config.authorize_with do |controller|
    if not current_user.admin?
      redirect_to main_app.root_path
      flash[:error] = "You are not an admin"
    end
  end
end