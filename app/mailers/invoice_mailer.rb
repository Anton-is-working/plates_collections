class InvoiceMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def invoice_created
    @invoice = params[:invoice]
    @collection_id = @invoice.from
    mail(to: @invoice.email, subject: 'Your Invoice has been created')
  end
end