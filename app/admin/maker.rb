ActiveAdmin.register Maker do
	permit_params :name, :email, 
								:company, :website, :password

	index do
    selectable_column
    id_column
    column :name
    column :email
    column :company
    column :website
    actions
  end

  form do |f|
    f.inputs "Maker information" do
      f.input :name
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
