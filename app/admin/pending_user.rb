ActiveAdmin.register User, as: "Pending Users" do
  menu parent: 'Users'

  controller do
    defaults :finder => :find_by_slug

    def scoped_collection
      resource_class.where(is_approved: false)
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
    column :is_approved do |user|
      link_to 'approve', approved_admin_pending_user_path(user)
    end
    actions
  end

  member_action :approved do
    user = User.friendly.find(params[:id])
    user.update_attribute(:is_approved, true)
    redirect_to request.referer, notice: "Successfully activated!"
  end
end