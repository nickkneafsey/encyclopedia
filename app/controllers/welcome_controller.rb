class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @summaries = Summary.order('summary_votes.count DESC')
                    .paginate(page: params[:page], per_page: 10)
  end
end
