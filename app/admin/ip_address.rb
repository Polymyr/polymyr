ActiveAdmin.register IpAddress do
	permit_params :address

	index do
    selectable_column
    id_column
    column :address
    column :count
    actions
  end

  form do |f|
    f.inputs "IP address information" do
	    f.input :address
    end
    f.actions
  end
end
