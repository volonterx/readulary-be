ActiveAdmin.register Book do
  filter :name
  filter :user
  filter :created_at
  filter :updated_at

  permit_params :name, :file, :cover, :user_id

  show do
    attributes_table do
      row :name
      row :file do |book|
        link_to book.file.filename, rails_blob_path(book.file, disposition: "attachment")
      end
      row :cover do |book|
        image_tag book.cover.representation(resize_to_limit: [200, 150])
      end
      row :user
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :name
      f.input :file, as: :file, hint: link_to(f.object.file.filename, rails_blob_path(f.object.file, disposition: "attachment"))
      f.input :cover, as: :file, hint: image_tag(f.object.cover.representation(resize_to_limit: [200, 150]))
    end
    f.actions
  end
end
