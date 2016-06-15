ActiveAdmin.register Event do
  filter :user
  filter :title
  filter :description
  filter :location
  filter :created_at
  index do
    column :id do |event|
      link_to event.id, event
    end
    column :title
    column :location do |event|
      event.location
    end
    column :description do |event|
      raw truncate(event.description, length: 100)
    end
    column :date
    column :image do |event|
      image_tag(event.image_url, width: 50)
    end
    actions
  end

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

end
