class Reviews::BuildController < ApplicationController
  include Wicked::Wizard

  steps :context, :setup, :review, :conclusion

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
      params.require(:review).permit(:answer1, :answer2, :answer3, :answer4, :answer5,
                                     :answer6, :answer7, :answer8, :answer9, :answer10,
                                     :answer11, :answer12, :answer13, :answer14, :answer15,
                                     :answer16, :answer17, :answer18, :answer19, :answer20,)
    end
end