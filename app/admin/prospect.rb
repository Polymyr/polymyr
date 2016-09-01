ActiveAdmin.register Prospect do
	permit_params :email

	index do
    selectable_column
    id_column
    column :email
    column :referral_code
    actions
  end

  form do |f|
    f.inputs "Prospect information" do
	    f.input :email
    end
    f.actions
  end
end