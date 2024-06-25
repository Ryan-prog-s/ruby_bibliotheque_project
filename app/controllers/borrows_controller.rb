class BorrowsController < ApplicationController
    before_action :set_borrow, only: [:destroy]
  
    def create
      @borrow = Borrow.new(borrow_params)
      @borrow.user = current_user
      @borrow.started_at = Time.now
  
      if @borrow.save
        redirect_to @borrow.book, notice: 'Book was successfully borrowed.'
      else
        redirect_to @borrow.book, alert: 'Book could not be borrowed.'
      end
    end
  
    def destroy
      @borrow.update(ended_at: Time.now)
      redirect_to @borrow.book, notice: 'Book was successfully returned.'
    end
  
    private
  
    def set_borrow
      @borrow = Borrow.find(params[:id])
    end
  
    def borrow_params
      params.permit(:book_id)
    end
  end
  