class ApplicationController < ActionController::Base

  include Pundit::Authorization

  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :skip_pundit?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "Você não está autorizado a praticar esta ação."
    redirect_to(root_path)
  end

  # authorize @curso # recomendado pela lecture do Pundit -> resultou erro

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :cpf, :telefone, :role])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :cpf, :telefone, :role, :foto])
    user.foto.attach(params[:foto]) unless params[:foto].nil?
  end
end
