ActiveAdmin.register Prospect do
	permit_params :email

	index do
    id_column
    column :email
    actions
  end

  form do |f|
    f.inputs "Prospect information" do
	    f.input :email
    end
    f.actions
  end
end