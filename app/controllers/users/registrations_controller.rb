class Users::RegistrationsController < Devise::RegistrationsController

  def edit

  end

  def update_resource(resource, params)
    if resource.password.blank?
      resource.update(params)
    end

  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      redirect_to :back
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private 
  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :address, :phone)
  end
end
