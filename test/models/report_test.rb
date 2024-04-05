# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @me = users(:me)
    @she = users(:she)
    @report = Report.create!(user: @me, title: 'mytest', content: 'today is cold' )
  end

  test '#editable' do
    assert_not @report.editable?(@alice)
    assert @report.editable?(@me)
  end

  test '#created_on' do
    assert_equal Date.today, @report.created_on
  end
end
