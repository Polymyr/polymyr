ActiveAdmin.register Maker do
	permit_params :first_name, :last_name, :email, 
								:company, :website, :password

	index do
    id_column
    column :first_name
    column :last_name
    column :email
    column :company
    column :website
    actions
  end

  form do |f|
    f.inputs "Maker information" do
      f.input :first_name
	    f.input :last_name
	    f.input :email
	    f.input :company
	    f.input :website
      if f.object.new_record?
          f.input :password
      end
    end
    f.actions
  end
end
