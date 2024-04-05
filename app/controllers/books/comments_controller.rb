# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = book.comments.build(params.require(:comment).permit(:content))
    comment.user = current_user
    comment.save!
    redirect_to book, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    redirect_to book, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end
end
