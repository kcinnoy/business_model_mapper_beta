class InvoicesController < ApplicationController

  def create
    @resource = Resource.find(params[:resource_id])
    @business = @resource.project.strategic_goal.business
    # @invoice = @resource.invoices.create!(business: @business)
    # redirect_to resource_invoices_path(@resource)

    if @resource.invoices.create!(business: @business)
      redirect_to resource_invoices_path(@resource)
    else
      redirect_to request.referrer
    end

  end

  def index
    @resource = Resource.find(params[:resource_id])
    @invoices = @resource.invoices
  end

  def show
    @invoice = Invoice.find(params[:id])
    render json: @invoice.to_json(only: [:id, :invoice_code],
      include: [ business: { only: [:id,:name, :description]},
      resource: { only: [:id,:name, :resource_type, :total_cost_year, :qty, :all_resource_cost]}]
    )
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @business = @invoice.business_id
    @invoice.destroy

    redirect_to business_path(@business)
  end
end
