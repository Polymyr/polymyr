ActiveAdmin.register Prospect do
	permit_params :email

	index do
    id_column
    column :email
    column :referral_code
    actions
  end

  form do |f|
    f.inputs "Prospect information" do
	    f.input :email
      f.input :referral_code
    end
    f.actions
  end
end