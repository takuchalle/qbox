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

  test 'should be valid when replay is blank' do
    @q.replay = ""
    assert @q.valid?
  end

  test 'token should be nil before save' do
    assert @q.valid?
    assert @q.token.nil?
  end

  test 'token should not be nil after save' do
    assert @q.valid?
    @q.save
    assert_not @q.token.nil?
  end

  test 'should have not attached' do
    assert @q.valid?
    assert_not @q.img.attached?
  end
end
