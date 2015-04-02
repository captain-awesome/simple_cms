class AdminUsersController < ApplicationController

	layout "admin"

	before_action :confirm_logged_in

  def index
  	@admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    # Instantiate a new object using form parameters
    @admin_user = AdminUser.new(admin_user_params)
    # Save the object
    if @admin_user.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Admin User created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def delete
  	@admin_user = AdminUser.find(params[:id])
  end

  def destroy
    admin_user = AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin User '#{admin_user.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  def edit
  	@admin_user = AdminUser.find(params[:id])
  end

	def update
		# Find an existing object using form parameters
		@admin_user = AdminUser.find(params[:id])
		# Update the object
		if @admin_user.update_attributes(admin_user_params)
		  # If update succeeds, redirect to the index action
		  flash[:notice] = "Admin User updated successfully."
		  redirect_to(:action => 'index')
		else
		  # If update fails, redisplay the form so user can fix problems
		  render('edit')
		end
	end  

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
  end

end