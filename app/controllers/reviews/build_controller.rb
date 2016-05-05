class Reviews::BuildController < ApplicationController
  include Wicked::Wizard

  steps :context, :unboxing, :setup, :review, :conclusion

  def show
    @review = Review.find(params[:review_id])
    render_wizard
  end


  def update
    @review = Review.find(params[:review_id])
    @review.update_attributes(build_params)
    render_wizard @review
  end

  private 

    def build_params
      params.require(:review).permit(:q1, :q2, :q3, :q4, :q5,
                                     :q6, :q7, :q8, :q9, :q10,
                                     :q11, :q12, :q13, :q14, :q15,
                                     :q16, :q17, :q18, :q19, :q20,
                                     :q21, :q22, :q23, :q24, :q25)
    end
end