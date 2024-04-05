# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    comment = report.comments.build(params.require(:comment).permit(:content))
    comment.user = current_user
    comment.save!
    redirect_to report, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def destroy
    report = Report.find(params[:report_id])
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    redirect_to report, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end
end
