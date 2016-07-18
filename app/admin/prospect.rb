ActiveAdmin.register Prospect do
	permit_params :name, :email

	index do
    id_column
    column :name
    column :email
    actions
  end

  form do |f|
    f.inputs "Prospect information" do
      f.input :name
	    f.input :email
    end
    f.actions
  end
end