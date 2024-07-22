# frozen_string_literal: true

class InvoicesController < ApplicationController
  def new
    @invoice = Invoice.new
    @collection_id = params[:collection_id]
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      puts @invoice.from
      InvoiceMailer.with(invoice: @invoice).invoice_created.deliver_now
      redirect_to new_invoice_path(collection_id: @invoice.from), notice: 'Invoice was successfully created and email was sent.'
    else
      render :new
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:name, :surname, :email, :from)
  end
end
