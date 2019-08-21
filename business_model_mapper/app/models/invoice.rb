class Invoice < ApplicationRecord
  belongs_to :resource
  belongs_to :business


before_create :set_invoice_code


  def set_invoice_code
    self.invoice_code = "#{self.business.name.upcase[0,2]}" + "#{self.resource.id}" + "-"+ "00" + "#{self.resource.invoices.maximum('id').to_i + 1}"
  end

end