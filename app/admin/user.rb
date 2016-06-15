ActiveAdmin.register User, as: 'All Users' do
  menu parent: 'Users'
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  controller do
    defaults :finder => :find_by_slug
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
      if user.is_approved
        link_to 'Deactivate', deactivated_admin_all_user_path(user)
      else
        link_to 'Activate', approved_admin_all_user_path(user)
      end
    end
    actions
  end

  member_action :deactivated do
    user = User.friendly.find(params[:id])
    user.update_attribute(:is_approved, false)
    redirect_to request.referer, notice: "Successfully Deactivated!"
  end
  member_action :approved do
    user = User.friendly.find(params[:id])
    user.update_attribute(:is_approved, true)
    redirect_to request.referer, notice: "Successfully activated!"
  end
end
