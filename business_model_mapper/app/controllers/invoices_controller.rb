class InvoicesController < ApplicationController

  def create
    @resource = Resource.find(params[:resource_id])
    @business = @resource.project.strategic_goal.business
    @invoice = @resource.invoices.create!(business: @business)
    redirect_to resource_invoices_path(@resource)
  end

  def index
    @resource = Resource.find(params[:resource_id])
    @invoices = @resource.invoices
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @business = @invoice.business_id
    @invoice.destroy

    redirect_to business_path(@business)
  end
end
