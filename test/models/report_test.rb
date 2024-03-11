# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'CRUD_report' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')
    nippo = me.reports.new(title: 'today', content: 'TT')
    assert_nil Report.find_by(title: 'today', content: 'TT')

    assert nippo.save
    assert Report.find_by(title: 'today', content: 'TT')
    nippo_id = nippo.id
    assert nippo.editable?(me)
    assert_not Report.find(nippo_id).editable?(she)

    assert nippo.update(title: 'aaa', content: 'omg')
    assert_equal 'aaa', Report.find(nippo_id).title
    assert nippo.editable?(me)
    assert_not Report.find(nippo_id).editable?(she)

    assert_equal Date.today, nippo.created_on

    nippo.destroy
    assert_nil Report.find_by(id: nippo_id)
  end
end
