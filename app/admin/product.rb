ActiveAdmin.register Product do
	permit_params :status, :name, :description, 
								:price, :rebate, :quantity,
								:story, :q1, :q2, :q3, :q4,
								:q5, :q6, :q7, :q8, :q9, :q10,
								:q11, :q12, :q13, :q14, :q15,
								:q16, :q17, :q18, :q19, :q20

	index do
		selectable_column
    id_column
    column :status
    column :name
    column :description
    column :price
    column :rebate
    column :quantity
    actions
  end

  form do |f|
    f.inputs "User information" do
    	f.input :status
      f.input :name
	    f.input :description
	    f.input :price
	    f.input :rebate
	    f.input :quantity
	    f.input :story
	    f.input :q1
	    f.input :q2
	    f.input :q3
	    f.input :q4
	    f.input :q5
	    f.input :q6
	    f.input :q7
	    f.input :q8
	    f.input :q9
	    f.input :q10
	    f.input :q11
	    f.input :q12
	    f.input :q13
	    f.input :q14
	    f.input :q15
	    f.input :q16
	    f.input :q17
	    f.input :q18
	    f.input :q19
	    f.input :q20
    end
    f.actions
  end
end
