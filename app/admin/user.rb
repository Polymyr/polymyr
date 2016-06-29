ActiveAdmin.register User do
	permit_params :name, :email, :password

	index do
    id_column
    column :name
    column :email
    actions
  end

  form do |f|
    f.inputs "User information" do
      f.input :name
      f.input :email
      if f.object.new_record?
          f.input :password
      end
    end
    f.actions
  end
end
