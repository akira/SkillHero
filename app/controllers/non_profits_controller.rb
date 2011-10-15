class NonProfitsController < InheritedResources::Base
    
  def create
    @non_profit = NonProfit.new(params[:non_profit])

    respond_to do |format|
      if @non_profit.save
        session[:non_profit_id] = @non_profit.id
        format.html { redirect_to @non_profit, notice: 'Non profit was successfully created.' }
        format.json { render json: @non_profit, status: :created, location: @non_profit }
      else
        format.html { render action: "new" }
        format.json { render json: @non_profit.errors, status: :unprocessable_entity }
      end
    end
  end
    
end