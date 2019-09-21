class InvoiceSerializer < ActiveModel::Serializer
  attributes :id , :invoice_code, :business, :resource

end
