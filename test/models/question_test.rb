require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @q = Question.new(content: "hogehoge")
  end

  test 'should be valid' do
    assert @q.valid?
  end

  test 'should be valid when content length is 140' do
    @q.content = 'a' * 140
    assert @q.valid?
  end

  test 'should not be valid when content is blank' do
    @q.content = ' '
    assert_not @q.valid?
  end

  test 'should not be valid when content is too long' do
    @q.content = 'a' * 141
    assert_not @q.valid?
  end
end
