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
end
