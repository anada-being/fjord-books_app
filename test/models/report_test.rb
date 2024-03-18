# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @me = users(:me)
    @she = users(:she)
    @report = reports(:one)
  end

  test 'editable_report' do
    assert @report.editable?(@alice)
    assert_not @report.editable?(@me)

    assert @report.update(title: 'aaa', content: 'omg')
    assert @report.editable?(@alice)
    assert_not @report.editable?(@she)
  end

  test 'created_report' do
    assert_equal Date.today, @report.created_on
  end
end
