ActiveAdmin.register User, as: "Approved Users" do
  menu parent: 'Users'

  controller do
    defaults :finder => :find_by_slug

    def scoped_collection
      resource_class.where(is_approved: true) # prevents N+1 queries to your database
    end
  end

  index do
    column :email
    column :first_name
    column :last_name
    column :middle_name
    column :dob
    column :address
    column :city
    column :estate
    column :country
    column 'approved' do |user|
      link_to 'Deactivate', deactivated_admin_approved_user_path(user)
    end
    actions
  end

  member_action :deactivated do
    user = User.friendly.find(params[:id])
    user.update_attribute(:is_approved, false)
    redirect_to request.referer, notice: "Successfully Deactivated!"
  end
end